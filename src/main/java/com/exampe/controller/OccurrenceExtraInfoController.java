package com.exampe.controller;

import com.exampe.enums.ExtraInfoField;
import com.exampe.enums.OccurrenceType;
import com.exampe.model.OccurrenceExtraInfo;
import com.exampe.repos.OccurrenceExtraInfoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class OccurrenceExtraInfoController {

    @Autowired
    private OccurrenceExtraInfoRepo OEIRepo;

    @GetMapping("/OEITable")
    public String occurrenceExtraInfoTable(Model model) {

        model.addAttribute("occurrenceType", OccurrenceType.values());

        model.addAttribute("accidentIllnessExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.ACCIDENT_ILLNESS)).collect(Collectors.toList()));

        model.addAttribute("deathExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.DEATH)).collect(Collectors.toList()));

        model.addAttribute("footBathExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.FOOT_BATH)).collect(Collectors.toList()));

        model.addAttribute("sellExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.SELL)).collect(Collectors.toList()));

        model.addAttribute("prophylacticExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.PROPHYLACTIC)).collect(Collectors.toList()));

        model.addAttribute("calvingExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CALVING)).collect(Collectors.toList()));

        model.addAttribute("castrationDehorningExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CASTRATION_DEHORNING)).collect(Collectors.toList()));

        model.addAttribute("conditionScoreExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CONDITION_SCORE)).collect(Collectors.toList()));

        model.addAttribute("dryingOffExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.DRYING_OFF)).collect(Collectors.toList()));

        model.addAttribute("hoofCareExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.HOOF_CARE)).collect(Collectors.toList()));

        model.addAttribute("inseminationExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.INSEMINATION)).collect(Collectors.toList()));

        model.addAttribute("milkYieldExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.MILK_YIELD)).collect(Collectors.toList()));

        model.addAttribute("pregnancyTestExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.PREGNANCY_TEST)).collect(Collectors.toList()));

        model.addAttribute("temperamentExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.TEMPERAMENT)).collect(Collectors.toList()));

        model.addAttribute("weaningExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.WEANING)).collect(Collectors.toList()));

        model.addAttribute("occurrenceExtraInfoList", OEIRepo.findAllActive());
        model.addAttribute("occurrenceExtraInfoNames", OEIRepo.findAllActive().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList()));

        return "occurrenceExtraInfo/occurrenceExtraInfoTable";
    }

    @PostMapping("/OEITable")
    public String addOccurrenceExtraInfo(OccurrenceExtraInfo occurrenceExtraInfo) {

        OEIRepo.save(occurrenceExtraInfo);

        return "redirect:/OEITable";
    }

    @GetMapping("/editOccurrenceExtraInfo/{occurrenceExtraInfo}")
    public String editOccurrenceExtraInfo(@PathVariable OccurrenceExtraInfo occurrenceExtraInfo, Model model) {

        model.addAttribute("occurrenceExtraInfo", occurrenceExtraInfo);
        model.addAttribute("occurrenceType", OccurrenceType.values());

        model.addAttribute("accidentIllnessExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.ACCIDENT_ILLNESS)).collect(Collectors.toList()));

        model.addAttribute("deathExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.DEATH)).collect(Collectors.toList()));

        model.addAttribute("footBathExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.FOOT_BATH)).collect(Collectors.toList()));

        model.addAttribute("sellExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.SELL)).collect(Collectors.toList()));

        model.addAttribute("prophylacticExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.PROPHYLACTIC)).collect(Collectors.toList()));

        model.addAttribute("calvingExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CALVING)).collect(Collectors.toList()));

        model.addAttribute("castrationDehorningExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CASTRATION_DEHORNING)).collect(Collectors.toList()));

        model.addAttribute("conditionScoreExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.CONDITION_SCORE)).collect(Collectors.toList()));

        model.addAttribute("dryingOffExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.DRYING_OFF)).collect(Collectors.toList()));

        model.addAttribute("hoofCareExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.HOOF_CARE)).collect(Collectors.toList()));

        model.addAttribute("inseminationExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.INSEMINATION)).collect(Collectors.toList()));

        model.addAttribute("milkYieldExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.MILK_YIELD)).collect(Collectors.toList()));

        model.addAttribute("pregnancyTestExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.PREGNANCY_TEST)).collect(Collectors.toList()));

        model.addAttribute("temperamentExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.TEMPERAMENT)).collect(Collectors.toList()));

        model.addAttribute("weaningExtraInfoField", Arrays.stream(ExtraInfoField.values()).
                filter(e -> e.getType().equals(OccurrenceType.WEANING)).collect(Collectors.toList()));

        List<String> names = OEIRepo.findAllActive().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList());

        names.remove(occurrenceExtraInfo.getName().toLowerCase());

        model.addAttribute("occurrenceExtraInfoNames", names);

        return "occurrenceExtraInfo/occurrenceExtraInfoEditing";

    }

    @PostMapping("/editOccurrenceExtraInfo/{occurrenceExtraInfo}")
    public String editOccurrenceExtraInfo(OccurrenceExtraInfo occurrenceExtraInfo) {

        OEIRepo.save(occurrenceExtraInfo);

        return "redirect:/OEITable";

    }

    @GetMapping("/deleteOccurrenceExtraInfo/{occurrenceExtraInfo}")
    public String deleteOccurrenceExtraInfo(@PathVariable OccurrenceExtraInfo occurrenceExtraInfo) {

        if (occurrenceExtraInfo.getChildren().isEmpty()) {

            OEIRepo.delete(occurrenceExtraInfo);

        } else {

            occurrenceExtraInfo.setHidden(true);
            OEIRepo.save(occurrenceExtraInfo);

        }

        return "redirect:/OEITable";
    }

}
