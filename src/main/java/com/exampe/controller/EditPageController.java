package com.exampe.controller;

import com.exampe.enums.*;
import com.exampe.enums.death.DeathMethod;
import com.exampe.enums.death.DeathReason;
import com.exampe.enums.hoofCare.*;
import com.exampe.model.Calf;
import com.exampe.model.Occurrence;
import com.exampe.model.PlaceOfHabitat;
import com.exampe.repos.*;
import com.exampe.service.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class EditPageController {

    @Autowired
    private CalfRepo calfRepo;

    @Autowired
    private MedRepo medRepo;

    @Autowired
    private OccurrenceExtraInfoRepo OEIRepo;

    @Autowired
    private BullRepo bullRepo;

    @Autowired
    private PersonRepo personRepo;

    @Autowired
    private OccurrenceRepo occurrenceRepo;

    @Autowired
    private Tools tools;

    @GetMapping("/edit/{calf}")
    public String editCalf(@PathVariable Calf calf, Model model) {

        tools.clearHidden();

        //Accident/Illness
        model.addAttribute("accidentIllnessOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.ACCIDENT_ILLNESS)).
                collect(Collectors.toList()));

        model.addAttribute("noneAndNormalWithdrawalMedicines", medRepo.findAllActive().stream().
                filter(m -> !m.getType().equals(MedicineType.COMPLEX_WITHDRAWAL)).collect(Collectors.toList()));

//        List<Occurrence> dryingOffList = calf.getOccurrences().stream().
//                filter(o -> o.getOccurrenceType().equals(OccurrenceType.DRYING_OFF))
//                .collect(Collectors.toList());

        //Calving
//        model.addAttribute("inseminationList", inseminationList);
//        model.addAttribute("dryingOffList", dryingOffList);



        model.addAttribute("inseminationList", calf.getOccurrences().stream().
                filter(o -> o.getOccurrenceType().equals(OccurrenceType.INSEMINATION)).
                filter(o->o.getCalving()==null).collect(Collectors.toList()));

        model.addAttribute("inseminationListForPregnancy", calf.getOccurrences().stream().
                filter(o -> o.getOccurrenceType().equals(OccurrenceType.INSEMINATION)).
                filter(o->o.getPregnancyTest()==null).collect(Collectors.toList()));

        //Castration Dehorning
        model.addAttribute("castrationDehorningOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.CASTRATION_DEHORNING)).
                collect(Collectors.toList()));

        //Condition Score
        model.addAttribute("conditionScoreOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.CONDITION_SCORE)).
                collect(Collectors.toList()));
        //Death
        model.addAttribute("deathCause", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_CAUSE)).
                collect(Collectors.toList()));

        model.addAttribute("deathVeterinaryNotes", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_VETERINARY_NOTES)).
                collect(Collectors.toList()));

        model.addAttribute("deathWhereTo", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.DEATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.DEATH_WHERE_TO)).
                collect(Collectors.toList()));

        model.addAttribute("deathReason", DeathReason.values());
        model.addAttribute("carcassRating", CarcassRating.values());
        model.addAttribute("deathMethod", DeathMethod.values());

        //DryingOff
        model.addAttribute("dryingOffOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.DRYING_OFF)).
                collect(Collectors.toList()));

        List<Occurrence> dryingOffList = calf.getOccurrences().stream().
                filter(o -> o.getOccurrenceType().equals(OccurrenceType.DRYING_OFF))
                .collect(Collectors.toList());

        if (dryingOffList.size() > 0) {

            Occurrence previousDryingOff = dryingOffList.get(dryingOffList.size() - 1);

            model.addAttribute("previousDryingOff", previousDryingOff);

        }

        //FootBath
        model.addAttribute("footBathProblem", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_PROBLEM)).
                collect(Collectors.toList()));

        model.addAttribute("footBathChemical", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_CHEMICAL)).
                collect(Collectors.toList()));

        model.addAttribute("footBathOther", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.FOOT_BATH_OTHER)).
                collect(Collectors.toList()));

        //Temperament
        model.addAttribute("temperamentOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.TEMPERAMENT)).
                collect(Collectors.toList()));

        //Hoof Care
        model.addAttribute("shape", HoofCareShape.values());
        model.addAttribute("hoof", Hoof.values());
        model.addAttribute("hoofCareType", HoofCareType.values());
        model.addAttribute("hoofCareMovement", HoofCareMovement.values());
        model.addAttribute("hoofCareOther", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.HOOF_CARE)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_OTHER)).
                collect(Collectors.toList()));

        model.addAttribute("hoofCareProblem", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.HOOF_CARE)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_PROBLEM)).
                collect(Collectors.toList()));

        model.addAttribute("hoofCareTreatment", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.HOOF_CARE)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.HOOF_CARE_TREATMENT)).
                collect(Collectors.toList()));

        //Weaning
        model.addAttribute("weaningOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.WEANING)).
                collect(Collectors.toList()));

        //Milk Yield
        model.addAttribute("milkYieldOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.MILK_YIELD)).
                collect(Collectors.toList()));

        //Insemination
        model.addAttribute("inseminationOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.INSEMINATION)).
                collect(Collectors.toList()));

        //Milk Yield
        model.addAttribute("footBathOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.FOOT_BATH)).
                collect(Collectors.toList()));

        //Pregnancy Test
        model.addAttribute("pregnancyTestOEI", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.PREGNANCY_TEST)).
                collect(Collectors.toList()));

        //Sell
        model.addAttribute("sellOther", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.SELL)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.SELL_OTHER)).
                collect(Collectors.toList()));

        model.addAttribute("sellWhoTo", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.SELL)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.SELL_WHO_TO)).
                collect(Collectors.toList()));

        //Prophylactic

        model.addAttribute("prophylacticOther", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_OTHER)).
                collect(Collectors.toList()));

        model.addAttribute("prophylacticReason", OEIRepo.findAllActive().stream().
                filter(i -> i.getOccurrenceType().equals(OccurrenceType.PROPHYLACTIC)).
                filter(i -> i.getExtraInfoField().equals(ExtraInfoField.PROPHYLACTIC_REASON)).
                collect(Collectors.toList()));

        model.addAttribute("calf", calf);
        model.addAttribute("OccurrencesList", calf.getOccurrences().stream().
                filter(o->!o.isHidden()).collect(Collectors.toList()));

        if (calf.getPlaces().size() > 0) {
            List<PlaceOfHabitat> places = calf.getPlaces();
            PlaceOfHabitat place = places.get(places.size() - 1);
            model.addAttribute("lastStartDate", place.getStartDate());
        }

        model.addAttribute("quantity", Quantity.values());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("placeOfBirth", PlaceOfBirth.values());
        model.addAttribute("birth", Birth.values());
        model.addAttribute("born", Born.values());
        model.addAttribute("colostrum", ColostrumByBottle.values());
        model.addAttribute("placeOfHabitat", PlaceOfHabitatName.values());
        model.addAttribute("medicines", medRepo.findAllActive());
        model.addAttribute("status", Status.values());

        if (calf.getGender().equals(Gender.MALE)) {

            model.addAttribute("castrationType", Castration_DehorningType.values());

        } else {

            model.addAttribute("castrationType", Collections.singletonList(Castration_DehorningType.DEHORNING));

        }

        model.addAttribute("bullBreed", BullBreed.values());
        model.addAttribute("inseminationType", InseminationType.values());
        model.addAttribute("people", personRepo.findAllActive());
        model.addAttribute("person", InseminationPerson.values());
        model.addAttribute("pregnantState", PregnantState.values());

        model.addAttribute("pregnancyMethod", PregnancyMethod.values());
        model.addAttribute("problem", HoofCareProblem.values());
        model.addAttribute("treatment", HoofCareTreatment.values());
        model.addAttribute("dryingOffClass", DryingOffClass.values());
        model.addAttribute("dryingOffType", DryingOffType.values());
        model.addAttribute("occurrenceType", OccurrenceType.values());
        model.addAttribute("fathers", bullRepo.findAllActive());

        return "calfEditing/calfEditPage";

    }

    @PostMapping("/edit/{calf}")
    public String editCalf(@PathVariable int calf, Calf c) {

        calfRepo.save(c);

        return "redirect:/edit/" + calf;
    }

}
