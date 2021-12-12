package com.exampe.controller.treatment;

import com.exampe.controller.FileController;
import com.exampe.model.sequences.CalvingSequence;
import com.exampe.model.sequences.MedicineInputSequence;
import com.exampe.enums.*;
import com.exampe.enums.death.DeathMethod;
import com.exampe.enums.death.DeathReason;
import com.exampe.enums.hoofCare.*;
import com.exampe.model.*;
import com.exampe.model.sequences.HoofCareProblemAndTreatmentSequence;
import com.exampe.repos.*;
import com.exampe.service.DateService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class OccurrenceController {

    @Autowired
    private OccurrenceRepo occurrenceRepo;

    @Autowired
    private CalfRepo calfRepo;

    @Autowired
    private OccurrenceExtraInfoRepo OEIRepo;

    @Autowired
    private MedRepo medRepo;

    @Autowired
    private PersonRepo personRepo;

    @Autowired
    private BullRepo bullRepo;

    @Autowired
    private FileController fileController;

    @PostMapping("/addOccurrence")
    public String add(Occurrence occurrence,
                      OccurrenceType occurrenceType,
                      @RequestParam Calf calf,
                      MultipartFile[] files,
                      String name,
                      String medicineInputSequenceArray,
                      String calvingInputSequenceArray,
                      String hoofCareInputSequenceArray
    ) throws IOException {

        ObjectMapper objectMapper = new ObjectMapper();

        if (occurrence.getDate() != null) {
            occurrence.setAge(DateService.calculateAge(occurrence.getDate(), calf.getBirthDate()));
        }

        if (occurrenceType.equals(OccurrenceType.DEATH)) {
            calf.setStatus(Status.DEAD);
        }

        if (occurrenceType.equals(OccurrenceType.SELL)) {
            calf.setStatus(Status.SOLD);
        }

        if (occurrenceType.equals(OccurrenceType.SELL) || occurrenceType.equals(OccurrenceType.DEATH)) {

            if (!calf.getPlaces().isEmpty()) {

                calf.getPlaces().get(calf.getPlaces().size() - 1).setEndDate(occurrence.getDate());

            }

        }

        if (occurrenceType.equals(OccurrenceType.INSEMINATION)) {

            occurrence.getBull().getOccurrences().add(occurrence);

        }

        if (occurrenceType.equals(OccurrenceType.PREGNANCY_TEST)) {

            occurrence.getInsemination().setPregnancyTest(occurrence);

        }

        if (medicineInputSequenceArray != null) {

            if (medicineInputSequenceArray.length() > 2) {

                List<MedicineInputSequence> medicineInputSequenceList =
                        new ArrayList<>(Arrays.asList(objectMapper.readValue(medicineInputSequenceArray,
                                MedicineInputSequence[].class)));

                occurrence.setMedicineInputSequenceList(medicineInputSequenceList);

                List<Medicine> medicineList = medRepo.findAllById(medicineInputSequenceList.stream().
                        map(MedicineInputSequence::getMedicineId)
                        .collect(Collectors.toList()));
                medicineList.forEach(m -> m.getOccurrences().add(occurrence));
                occurrence.setMedicineList(medicineList);

                List<Person> personList = personRepo.findAllById(medicineInputSequenceList.stream().
                        map(MedicineInputSequence::getPersonId)
                        .collect(Collectors.toList()));
                personList.forEach(p -> p.getOccurrences().add(occurrence));
                occurrence.setPersonList(personList);

            }

        }

        if (hoofCareInputSequenceArray != null) {

            if (hoofCareInputSequenceArray.length() > 2) {

                List<HoofCareProblemAndTreatmentSequence> hoofCareProblemAndTreatmentSequenceList =
                        new ArrayList<>(Arrays.asList(objectMapper.readValue(hoofCareInputSequenceArray,
                                HoofCareProblemAndTreatmentSequence[].class)));

                occurrence.setHoofCareProblemAndTreatmentSequenceList(hoofCareProblemAndTreatmentSequenceList);

                List<Integer> problemIds = new ArrayList<>();
                List<Integer> treatmentIds = new ArrayList<>();

                for (HoofCareProblemAndTreatmentSequence h : hoofCareProblemAndTreatmentSequenceList) {

                    String[] problemTempArray = h.getProblemId().split(",");
                    String[] treatmentTempArray = h.getTreatmentId().split(",");

                    problemIds.addAll(Arrays.stream(problemTempArray).map(Integer::parseInt).collect(Collectors.toList()));
                    treatmentIds.addAll(Arrays.stream(treatmentTempArray).map(Integer::parseInt).collect(Collectors.toList()));

                }

                List<OccurrenceExtraInfo> problemList = OEIRepo.findAllById(problemIds);

                problemList.forEach(p -> p.getChildren().add(occurrence));

                if (occurrence.getOEIList() != null) {
                    occurrence.getOEIList().addAll(problemList);
                } else {
                    occurrence.setOEIList(problemList);
                }

                List<OccurrenceExtraInfo> treatmentList = OEIRepo.findAllById(treatmentIds);

                treatmentList.forEach(p -> p.getChildren().add(occurrence));
                occurrence.getOEIList().addAll(treatmentList);

            }

        }

        if (calvingInputSequenceArray != null) {

            if (calvingInputSequenceArray.length() > 2) {

                List<CalvingSequence> calvingSequenceList =
                        new ArrayList<>(Arrays.asList(objectMapper.readValue(calvingInputSequenceArray,
                                CalvingSequence[].class)));

                Quantity quantity = null;

                switch (calvingSequenceList.size()) {

                    case 1:
                        quantity = Quantity.SINGLE;
                        break;
                    case 2:
                        quantity = Quantity.TWIN;
                        break;
                    case 3:
                        quantity = Quantity.TRIPLET;
                        break;

                }

                DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");

                occurrence.setDate(LocalDate.parse(calvingSequenceList.get(0).getDateOfBirth(), timeFormatter));

                occurrence.setAge(DateService.calculateAge(occurrence.getDate(), calf.getBirthDate()));

                Occurrence insemination = occurrence.getInsemination();

                occurrence.getInsemination().setCalving(occurrence);

                for (CalvingSequence c : calvingSequenceList) {

                    String[] births = c.getBirth().split(",");

                    List<Birth> birthList = new ArrayList<>();

                    BullBreed MF = calf.getFather().getBullBreed();
                    BullBreed F = insemination.getBull().getBullBreed();

                    String newCalfBreed = MF.name() + "x" + F.name();

                    Arrays.stream(births).forEach(b -> {

                        for (Birth value : Birth.values()) {

                            if (value.toString().equals(b)) {

                                birthList.add(value);

                            }

                        }

                    });

                    Calf newCalf = new Calf();

                    LocalDate bDate = LocalDate.parse(c.getDateOfBirth(), timeFormatter);

                    newCalf.setGestation((int) ChronoUnit.DAYS.between(insemination.getDate(),bDate));

                    newCalf.setCalfId(c.getCalfId());
                    newCalf.setBirthDate(bDate);
                    newCalf.setBirthPlace(c.getPlaceOfBirth());
                    newCalf.setBorn(c.getBorn());
                    newCalf.setGender(c.getGender());
                    newCalf.setColostrum(c.getColostrum());
                    newCalf.setStatus(c.getStatus());
                    newCalf.setQuantity(quantity);
                    newCalf.setBirthList(birthList);
                    newCalf.setBornByCalving(true);
                    newCalf.setMother(calf);
                    calf.getChildren().add(newCalf);
                    newCalf.setBreed(newCalfBreed);
                    newCalf.setFather(insemination.getBull());
                    newCalf.setCalving(occurrence);
                    insemination.getBull().getChildren().add(newCalf);

                    calfRepo.save(newCalf);

                    c.setDbId(newCalf.getId());
                    c.setBDate(bDate);

                }

                List<Integer> integers = calvingSequenceList.stream().map(CalvingSequence::getDbId).
                        collect(Collectors.toList());

                occurrence.setCalvingSequence(integers);

            }

        }

        if (name != null && !name.isEmpty()) {

            OccurrenceExtraInfo OEI = new OccurrenceExtraInfo();

            OEI.setParent(occurrence.getOccurrenceType());
            OEI.setName(name);
            OEIRepo.save(OEI);

            if (occurrence.getOEIList() == null) {

                occurrence.setOEIList(Collections.singletonList(OEI));

            } else occurrence.getOEIList().add(OEI);

        }

        if (files[0].getSize() > 0) {

            fileController.addFiles(occurrence, files);

        }

        occurrenceRepo.save(occurrence);

        return "redirect:/edit/" + calf.getId() + "#treatment/";
    }

    @GetMapping("/deleteOccurrence/{occurrence}")
    public String delete(@PathVariable Occurrence occurrence,
                         @RequestParam Calf calf) {

        if (!occurrence.getFileList().isEmpty()) {

            occurrence.getFileList().forEach(f -> {
                try {
                    FileController.deleteFileFromDisk(f.getFileName());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });

        }

        switch (occurrence.getOccurrenceType()) {

            case DEATH:
            case SELL:
                calf.setStatus(Status.ALIVE);
                if (!calf.getPlaces().isEmpty()) {

                    calf.getPlaces().get(calf.getPlaces().size() - 1).setEndDate(null);

                }
                break;

            case INSEMINATION:

                if (occurrence.getCalving() == null) {

                    if (occurrence.getPregnancyTest() != null) {
                        occurrence.getPregnancyTest().setInsemination(null);
                    }

                    occurrenceRepo.delete(occurrence);

                } else {

                    occurrence.setHidden(true);

                }
                break;

            case CALVING:
                occurrence.getInsemination().setCalving(null);
                occurrenceRepo.delete(occurrence);
                break;

            case PREGNANCY_TEST:
                occurrence.getInsemination().setPregnancyTest(null);
                occurrenceRepo.delete(occurrence);
                break;

            default:
                occurrenceRepo.delete(occurrence);

        }

        return "redirect:/edit/" + calf.getId() + "#treatment/";

    }

    @GetMapping("/editOccurrence/{occurrence}")
    public String editOccurrence(@PathVariable Occurrence occurrence,
                                 @RequestParam Calf calf,
                                 Model model) {

        model.addAttribute("calf", calf);
        model.addAttribute("occurrence", occurrence);
        model.addAttribute("occurrenceOEIList", occurrence.getOEIList());

        model.addAttribute("shape", HoofCareShape.values());
        model.addAttribute("hoof", Hoof.values());

        model.addAttribute("OEIList", OEIRepo.findAll().stream().
                filter(o -> o.getOccurrenceType().equals(occurrence.getOccurrenceType())).
                collect(Collectors.toList()));

        //Pregnancy Test
        model.addAttribute("pregnantList", PregnantState.values());
        if (occurrence.getInsemination() != null) {
            model.addAttribute("insemination", occurrence.getInsemination());
        } else {
            model.addAttribute("insemination", "None");
        }
        model.addAttribute("methodList", PregnancyMethod.values());

        //Accident Illness
        model.addAttribute("noneAndNormalWithdrawalMedicines", medRepo.findAll().stream().
                filter(m -> !m.getType().equals(MedicineType.COMPLEX_WITHDRAWAL)).collect(Collectors.toList()));

        model.addAttribute("people", personRepo.findAll());

        model.addAttribute("pob", PlaceOfBirth.values());
        model.addAttribute("born", Born.values());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("status", Status.values());
        model.addAttribute("colostrum", ColostrumByBottle.values());
        model.addAttribute("birth", Birth.values());

        if (occurrence.getOccurrenceType().equals(OccurrenceType.CALVING)) {


            model.addAttribute("calfBirth", Birth.values());

            List<Calf> children = new ArrayList<>();

            for (Integer integer : occurrence.getCalvingSequence()) {

                for (Calf child : calf.getChildren()) {

                    if (child.getId() == integer)
                        children.add(child);

                }

            }

            model.addAttribute("children", children);
            model.addAttribute("inseminationList", calf.getOccurrences().stream().
                    filter(o -> o.getOccurrenceType().
                            equals(OccurrenceType.INSEMINATION)).
                    filter(o -> o.getCalving() == null)
                    .collect(Collectors.toList()));

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.INSEMINATION)) {
            model.addAttribute("inseminationType", InseminationType.values());
            model.addAttribute("person", InseminationPerson.values());
            model.addAttribute("fathers", bullRepo.findAllActive());

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.DEATH)) {

            model.addAttribute("deathWhereTo", occurrence.getOEIList().stream().
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.DEATH_WHERE_TO)).findAny().get());

            model.addAttribute("deathCause", OEIRepo.findAll().stream().
                    filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                    filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_CAUSE)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceDeathCause", occurrence.getOEIList().stream().
                    filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                    filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_CAUSE)).
                    collect(Collectors.toList()));

            model.addAttribute("deathVeterinaryNotes", OEIRepo.findAll().stream().
                    filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                    filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_VETERINARY_NOTES)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceDeathVeterinaryNotes", occurrence.getOEIList().stream().
                    filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                    filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_VETERINARY_NOTES)).
                    collect(Collectors.toList()));

            model.addAttribute("deathWhereToList", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.DEATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.DEATH_WHERE_TO)).
                    collect(Collectors.toList()));

            model.addAttribute("deathMethod", DeathMethod.values());
            model.addAttribute("deathReason", DeathReason.values());
            model.addAttribute("carcassRating", CarcassRating.values());
        }


        model.addAttribute("hoofCareProblem", OEIRepo.findAll().stream().
                filter(o -> o.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_PROBLEM)).
                collect(Collectors.toList()));

        model.addAttribute("hoofCareTreatment", OEIRepo.findAll().stream().
                filter(o -> o.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_TREATMENT)).
                collect(Collectors.toList()));

        if (occurrence.getOccurrenceType().equals(OccurrenceType.HOOF_CARE)) {


            model.addAttribute("hoofCareMovement", HoofCareMovement.values());
            model.addAttribute("hoofCareType", HoofCareType.values());

            model.addAttribute("OEIList", OEIRepo.findAll().stream().
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_OTHER)).
                    collect(Collectors.toList()));

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)) {

            model.addAttribute("placeOfHabitat", PlaceOfHabitatName.values());

            model.addAttribute("occurrenceFootBathChemical", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_CHEMICAL)).
                    collect(Collectors.toList()));

            model.addAttribute("footBathChemical", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_CHEMICAL)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceFootBathProblem", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_PROBLEM)).
                    collect(Collectors.toList()));

            model.addAttribute("footBathProblem", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_PROBLEM)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceOEIList", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_OTHER)).
                    collect(Collectors.toList()));

            model.addAttribute("OEIList", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_OTHER)).
                    collect(Collectors.toList()));

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)) {

            model.addAttribute("occurrenceProphylacticReason", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_REASON)).
                    collect(Collectors.toList()));

            model.addAttribute("prophylacticReason", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_REASON)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceOEIList", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_OTHER)).
                    collect(Collectors.toList()));

            model.addAttribute("OEIList", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_OTHER)).
                    collect(Collectors.toList()));

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.SELL)) {

            model.addAttribute("occurrenceSellWhoTo", occurrence.getOEIList().stream().
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.SELL_WHO_TO)).findAny().get());

            model.addAttribute("sellWhoToList", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.SELL)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.SELL_WHO_TO)).
                    collect(Collectors.toList()));

            model.addAttribute("occurrenceOEIList", occurrence.getOEIList().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.SELL)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.SELL_OTHER)).
                    collect(Collectors.toList()));

            model.addAttribute("OEIList", OEIRepo.findAll().stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.SELL)).
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.SELL_OTHER)).
                    collect(Collectors.toList()));

        }

        if (occurrence.getOccurrenceType().equals(OccurrenceType.CASTRATION_DEHORNING)) {

            if (calf.getGender().equals(Gender.MALE)) {

                model.addAttribute("castrationDehorningType", Castration_DehorningType.values());

            } else

                model.addAttribute("castrationDehorningType", Collections.singleton(Castration_DehorningType.DEHORNING));

        }

        return "calfEditing/treatment/occurrences/occurrenceEditing";
    }

    @PostMapping("/editOccurrence/{occurrence}")
    public String editOccurrence(@RequestParam Calf calf,
                                 Occurrence occurrence,
                                 MultipartFile[] files,
                                 String medicineInputSequenceArray,
                                 String calvingInputSequenceArray,
                                 String hoofCareInputSequenceArray
    ) throws JsonProcessingException {

        occurrence.setAge(DateService.calculateAge(occurrence.getDate(), calf.getBirthDate()));

        ObjectMapper objectMapper = new ObjectMapper();

        if (medicineInputSequenceArray.length() > 2) {

            List<MedicineInputSequence> medicineInputSequenceList =
                    new ArrayList<>(Arrays.asList(objectMapper.readValue(medicineInputSequenceArray,
                            MedicineInputSequence[].class)));

            occurrence.setMedicineInputSequenceList(medicineInputSequenceList);

            List<Medicine> medicineList = medRepo.findAllById(medicineInputSequenceList.stream().
                    map(MedicineInputSequence::getMedicineId)
                    .collect(Collectors.toList()));
            medicineList.forEach(m -> m.getOccurrences().add(occurrence));
            occurrence.setMedicineList(medicineList);

            List<Person> personList = personRepo.findAllById(medicineInputSequenceList.stream().
                    map(MedicineInputSequence::getPersonId)
                    .collect(Collectors.toList()));
            personList.forEach(p -> p.getOccurrences().add(occurrence));
            occurrence.setPersonList(personList);

        } else occurrence.getMedicineInputSequenceList().clear();

        if (hoofCareInputSequenceArray.length() > 2) {

            List<HoofCareProblemAndTreatmentSequence> hoofCareProblemAndTreatmentSequenceList =
                    new ArrayList<>(Arrays.asList(objectMapper.readValue(hoofCareInputSequenceArray,
                            HoofCareProblemAndTreatmentSequence[].class)));

            occurrence.setHoofCareProblemAndTreatmentSequenceList(hoofCareProblemAndTreatmentSequenceList);

            List<Integer> problemIds = new ArrayList<>();
            List<Integer> treatmentIds = new ArrayList<>();

            for (HoofCareProblemAndTreatmentSequence h : hoofCareProblemAndTreatmentSequenceList) {

                String[] problemTempArray = h.getProblemId().split(",");
                String[] treatmentTempArray = h.getTreatmentId().split(",");

                problemIds.addAll(Arrays.stream(problemTempArray).map(Integer::parseInt).collect(Collectors.toList()));
                treatmentIds.addAll(Arrays.stream(treatmentTempArray).
                        map(Integer::parseInt).collect(Collectors.toList()));

            }

            occurrence.getOEIList().removeAll(occurrence.getOEIList().stream().
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_PROBLEM)).
                    collect(Collectors.toList()));

            occurrence.getOEIList().removeAll(occurrence.getOEIList().stream().
                    filter(o -> o.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_TREATMENT)).
                    collect(Collectors.toList()));

            List<OccurrenceExtraInfo> problemList = OEIRepo.findAllById(problemIds);

            problemList.forEach(p -> p.getChildren().add(occurrence));

            if (occurrence.getOEIList() != null) {
                occurrence.getOEIList().addAll(problemList);
            } else {
                occurrence.setOEIList(problemList);
            }

            List<OccurrenceExtraInfo> treatmentList = OEIRepo.findAllById(treatmentIds);

            treatmentList.forEach(p -> p.getChildren().add(occurrence));
            occurrence.getOEIList().addAll(treatmentList);

        }

        if (calvingInputSequenceArray != null) {

            if (calvingInputSequenceArray.length() > 2) {

                List<CalvingSequence> calvingSequenceList =
                        new ArrayList<>(Arrays.asList(objectMapper.readValue(calvingInputSequenceArray,
                                CalvingSequence[].class)));

                List<Integer> idsAfter = calvingSequenceList.stream().
                        map(CalvingSequence::getDbId).collect(Collectors.toList());

                occurrence.getCalvingSequence().removeAll(idsAfter);

                occurrence.getCalvingSequence().forEach(c -> calfRepo.deleteById(c));

                Quantity quantity = null;

                switch (calvingSequenceList.size()) {

                    case 1:
                        quantity = Quantity.SINGLE;
                        break;
                    case 2:
                        quantity = Quantity.TWIN;
                        break;
                    case 3:
                        quantity = Quantity.TRIPLET;
                        break;

                }

                DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");

                occurrence.setDate(LocalDate.parse(calvingSequenceList.get(0).getDateOfBirth(), timeFormatter));

                occurrence.setAge(DateService.calculateAge(occurrence.getDate(), calf.getBirthDate()));

                Occurrence insemination = occurrence.getInsemination();

                for (CalvingSequence c : calvingSequenceList) {

                    String[] births = c.getBirth().split(",");

                    List<Birth> birthList = new ArrayList<>();

                    BullBreed MF = calf.getFather().getBullBreed();
                    BullBreed F = insemination.getBull().getBullBreed();

                    String newCalfBreed = MF.name() + "x" + F.name();

                    Arrays.stream(births).forEach(b -> {

                        for (Birth value : Birth.values()) {

                            if (value.toString().equals(b)) {

                                birthList.add(value);

                            }

                        }

                    });

                    Calf tempCalf;

                    if (c.getDbId() == -1) {

                        tempCalf = new Calf();

                    } else {

                        tempCalf = calfRepo.getOne(c.getDbId());

                    }

                    LocalDate bDate = LocalDate.parse(c.getDateOfBirth(), timeFormatter);

                    tempCalf.setGestation((int) ChronoUnit.DAYS.between(insemination.getDate(),bDate));

                    tempCalf.setCalfId(c.getCalfId());
                    tempCalf.setBirthDate(bDate);
                    tempCalf.setBirthPlace(c.getPlaceOfBirth());
                    tempCalf.setBorn(c.getBorn());
                    tempCalf.setGender(c.getGender());
                    tempCalf.setColostrum(c.getColostrum());
                    tempCalf.setStatus(c.getStatus());
                    tempCalf.setQuantity(quantity);
                    tempCalf.setBirthList(birthList);
                    tempCalf.setBornByCalving(true);
                    tempCalf.setMother(calf);
                    calf.getChildren().add(tempCalf);
                    tempCalf.setFather(insemination.getBull());
                    tempCalf.getFather().getChildren().add(calf);
                    insemination.getBull().getChildren().add(tempCalf);
                    tempCalf.setBreed(newCalfBreed);
                    tempCalf.setCalving(occurrence);

                    calfRepo.save(tempCalf);

                    c.setDbId(tempCalf.getId());
                    c.setBDate(bDate);

                }

                List<Integer> integers = calvingSequenceList.stream().map(CalvingSequence::getDbId).
                        collect(Collectors.toList());

                occurrence.setCalvingSequence(integers);

            }

        }

        if (files[0].getSize() > 0) {

            fileController.addFiles(occurrence, files);

        }

        occurrenceRepo.save(occurrence);

        return "redirect:/edit/" + calf.getId() + "#treatment/";

    }

}
