package com.exampe.controller;

import com.exampe.enums.MedicineType;
import com.exampe.enums.State;
import com.exampe.model.Medicine;
import com.exampe.repos.MedRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MedicineController {

    @Autowired
    private MedRepo medRepo;

    @GetMapping("/medicineTable")
    public String medicineTable(Model model) {

        model.addAttribute("medicines", medRepo.findAllActive());
        model.addAttribute("medicineNames", medRepo.findAllActive().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList()));
        model.addAttribute("medicineTypes", MedicineType.values());
        return "medicine/medicineTable";
    }

    @PostMapping("/medicineTable")
    public String addMedicine(Medicine medicine) {
        medRepo.save(medicine);
        return "redirect:/medicineTable";
    }

    @GetMapping("/editMedicine/{medicine}")
    public String editMedicine(@PathVariable Medicine medicine, Model model) {

        model.addAttribute("medicine", medicine);
        model.addAttribute("medicineType", MedicineType.values());

        List<String> names = medRepo.findAllActive().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList());

        names.remove(medicine.getName().toLowerCase());

        model.addAttribute("medicineNames", names);
        return "medicine/medicineEditing";

    }

    @PostMapping("/editMedicine/{medicine}")
    public String editMedicine(Medicine medicine) {
        medRepo.save(medicine);
        return "redirect:/medicineTable";
    }

    @GetMapping("/deleteMedicine/{medicine}")
    public String deleteMedicine(@PathVariable Medicine medicine) {

        if (medicine.getOccurrences().isEmpty()) {

            medRepo.delete(medicine);

        } else {

            medicine.setHidden(true);
            medRepo.save(medicine);

        }

        return "redirect:/medicineTable";
    }

}
