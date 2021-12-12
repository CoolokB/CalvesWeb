package com.exampe.controller;

import com.exampe.enums.*;
import com.exampe.model.Bull;
import com.exampe.model.Calf;
import com.exampe.repos.BullRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BullController {

    @Autowired
    private BullRepo bullRepo;

    @GetMapping("/bullTable")
    public String bullTable(Model model) {
        model.addAttribute("bullBreed", BullBreed.values());
        model.addAttribute("bullsList", bullRepo.findAllActive());
        model.addAttribute("bullsNames", bullRepo.findAllActive().stream().map(m->m.getName().toLowerCase()).
                collect(Collectors.toList()));
        return "bullTable/bullTable";
    }

    @PostMapping("/bullTable")
    public String addBull(Bull bull) {

        bullRepo.save(bull);
        return "redirect:/bullTable";
    }

    @GetMapping("/editBull/{bull}")
    public String editBull(@PathVariable Bull bull, Model model) {

        model.addAttribute("bull", bull);
        model.addAttribute("bullBreed", BullBreed.values());

        List<String> names = bullRepo.findAllActive().stream().map(m->m.getName().toLowerCase()).
                collect(Collectors.toList());

        names.remove(bull.getName().toLowerCase());
        model.addAttribute("bullsNames",names);

        return "bullTable/bullEditing";

    }

    @PostMapping("/editBull/{bull}")
    public String editBull(Bull b) {

        bullRepo.save(b);

        return "redirect:/bullTable";
    }

    @GetMapping("/deleteBull/{bull}")
    public String deleteBull(@PathVariable Bull bull) {

        if (bull.getChildren().isEmpty()) {

            bullRepo.delete(bull);

        } else {

            bull.setHidden(true);
            bullRepo.save(bull);

        }

        return "redirect:/bullTable";

    }

}
