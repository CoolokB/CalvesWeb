package com.exampe.controller;

import com.exampe.enums.*;
import com.exampe.enums.death.DeathMethod;
import com.exampe.enums.hoofCare.HoofCareMovement;
import com.exampe.enums.hoofCare.HoofCareShape;
import com.exampe.model.Calf;
import com.exampe.model.Occurrence;
import com.exampe.model.sequences.CalvingSequence;
import com.exampe.repos.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Autowired
    private CalfRepo calfRepo;

    @Autowired
    private MedRepo medRepo;

    @Autowired
    private BullRepo bullRepo;

    @Autowired
    private OccurrenceRepo occurrenceRepo;

    @Autowired
    private FileController fileController;

    @GetMapping("/delete/{calf}")
    public String delete(@PathVariable Calf calf) {

        if (calf.getChildren().isEmpty()) {
            calfRepo.delete(calf);

        } else {

            calf.setHidden(true);

        }

        deleteFiles(calf);

        return "redirect:/mainTable";

    }

    private static void deleteFiles(Calf calf) {

        calf.getOccurrences().forEach(
                occurrence -> occurrence.getFileList().forEach(f -> {
                    try {
                        FileController.deleteFileFromDisk(f.getFileName());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                })
        );

        calf.getFileList().forEach(f -> {
            try {
                FileController.deleteFileFromDisk(f.getFileName());
            } catch (IOException e) {
                e.printStackTrace();
            }

        });


    }

    @GetMapping("/mainTable")
    public String main(Model model) {

        model.addAttribute("breed", BullBreed.values());
        model.addAttribute("quantity", Quantity.values());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("placeOfBirth", PlaceOfBirth.values());
        model.addAttribute("birth", Birth.values());
        model.addAttribute("born", Born.values());
        model.addAttribute("colostrum", ColostrumByBottle.values());
        model.addAttribute("placeOfHabitat", PlaceOfHabitatName.values());
        model.addAttribute("medicines", medRepo.findAll());
        model.addAttribute("status", Status.values());
        model.addAttribute("castrationType", Castration_DehorningType.values());
        model.addAttribute("deathMethod", DeathMethod.values());
        model.addAttribute("movement", HoofCareMovement.values());
        model.addAttribute("shape", HoofCareShape.values());
        model.addAttribute("bullBreed", BullBreed.values());
        model.addAttribute("inseminationType", InseminationType.values());
        model.addAttribute("person", InseminationPerson.values());
        model.addAttribute("pregnantState", PregnantState.values());

        model.addAttribute("feet", Feet.values());
        model.addAttribute("dryingOffTeat", DryingOffTeat.values());
        model.addAttribute("dryingOffType", DryingOffType.values());
        model.addAttribute("calves", calfRepo.findAllActive());
        model.addAttribute("mothers", calfRepo.findAll().stream().
                filter(c -> c.getGender().equals(Gender.FEMALE)).collect(Collectors.toList()));
        model.addAttribute("fathers", bullRepo.findAllActive());
        model.addAttribute("conditionScore", Arrays.asList(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5));
        model.addAttribute("lactationNumber", Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));

        return "mainTable/mainPage";
    }

    @PostMapping("/mainTable")
    public String add(Calf calf, MultipartFile[] files, String absentMotherId, Birth[] birth) throws IOException {

        if (calf.getIdOfMother() == -1) {
            calf.setIdOfMother(Integer.parseInt(absentMotherId));
        }

        calf.getFather().getChildren().add(calf);

        List<Birth> births = new ArrayList<>(Arrays.asList(birth));

        calf.setBirthList(births);

        if (files[0].getSize() > 0) {

            fileController.addCalfFiles(files, calf);

        }

        calfRepo.save(calf);

        return "redirect:/mainTable";

    }

    @GetMapping("/files/{calf}")
    public String showFiles(@PathVariable Calf calf, Model model) {

        model.addAttribute("calf", calf);

        return "mainTable/filesLightPage";

    }

    @GetMapping("/editCalving/{calf}")
    public String editCalving(@PathVariable Calf calf, Model model) {

        Calf mother = calf.getMother();

        Occurrence occurrence = mother.getOccurrences().stream().
                filter(o -> o.getCalvingSequence().contains(calf.getId())).findAny().get();

        List<Calf> children = new ArrayList<>();

        for (Integer integer : occurrence.getCalvingSequence()) {

            for (Calf child : mother.getChildren()) {

                if (child.getId() == integer)
                    children.add(child);

            }

        }

        model.addAttribute("pob", PlaceOfBirth.values());
        model.addAttribute("mother", mother.getId());
        model.addAttribute("born", Born.values());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("status", Status.values());
        model.addAttribute("colostrum", ColostrumByBottle.values());
        model.addAttribute("birth", Birth.values());

        model.addAttribute("children", children);
        model.addAttribute("occurrence", occurrence);

        return "mainTable/calvingEditing";

    }

    @PostMapping("/editCalving/{calf}")
    public String editCalving(String calvingInputSequenceArray, Occurrence occurrence, int motherID)
            throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();

        Calf mother = calfRepo.getOne(motherID);

        occurrence.setCalf(mother);

        List<CalvingSequence> calvingSequenceList =
                new ArrayList<>(Arrays.asList(objectMapper.readValue(calvingInputSequenceArray,
                        CalvingSequence[].class)));

        List<Integer> idsAfter = calvingSequenceList.stream().
                map(CalvingSequence::getDbId).collect(Collectors.toList());

        occurrence.getCalvingSequence().removeAll(idsAfter);

        occurrence.getCalvingSequence().forEach(c -> calfRepo.deleteById(c));

        if (calvingInputSequenceArray.length() > 2) {

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

            for (CalvingSequence c : calvingSequenceList) {

                String[] births = c.getBirth().split(",");

                List<Birth> birthList = new ArrayList<>();

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
                tempCalf.setMother(mother);
                mother.getChildren().add(tempCalf);
                tempCalf.getFather().getChildren().add(mother);
                tempCalf.setCalving(occurrence);

                calfRepo.save(tempCalf);

                c.setDbId(tempCalf.getId());
                c.setBDate(bDate);

            }

            List<Integer> integers = calvingSequenceList.stream().map(CalvingSequence::getDbId).
                    collect(Collectors.toList());

            occurrence.setCalvingSequence(integers);

        }

        occurrenceRepo.save(occurrence);

        return "redirect:/mainTable";

    }


    @GetMapping("/bullingCalendar")
    public String bullingCalendar(Model model) {

        model.addAttribute("calves", calfRepo.findAllActive().stream().
                filter(c-> c.getGender().equals(Gender.FEMALE)).
                filter(c->c.getStatus().equals(Status.ALIVE)).
                filter(c->c.getRealAge()>365).collect(Collectors.toList()));


    Long h =    calfRepo.findAllActive().stream().
                filter(c->c.getRealAge()>365).count();


        return "bullingCalendar/bullingTable";
    }

}
