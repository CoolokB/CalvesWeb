package com.exampe.controller;

import com.exampe.enums.PersonPosition;
import com.exampe.model.Person;
import com.exampe.repos.PersonRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonController {

    @Autowired
    private PersonRepo personRepo;

    @GetMapping("/personTable")
    public String personTable(Model model) {
        model.addAttribute("personList", personRepo.findAllActive());
        model.addAttribute("personPosition", PersonPosition.values());
        model.addAttribute("personNames", personRepo.findAllActive().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList()));
        return "personTable/personTable";
    }

    @PostMapping("/personTable")
    public String addPerson(Person person) {

        personRepo.save(person);
        return "redirect:/personTable";
    }

    @GetMapping("/editPerson/{person}")
    public String editPerson(@PathVariable Person person, Model model) {

        model.addAttribute("person", person);
        model.addAttribute("personPosition", PersonPosition.values());

        List<String> names = personRepo.findAll().stream().map(m -> m.getName().toLowerCase()).
                collect(Collectors.toList());

        names.remove(person.getName().toLowerCase());
        model.addAttribute("personNames", names);

        return "personTable/personEditing";

    }

    @PostMapping("/editPerson/{person}")
    public String editPerson(Person p) {

        personRepo.save(p);

        return "redirect:/personTable";
    }

    @GetMapping("/deletePerson/{person}")
    public String deletePerson(@PathVariable Person person) {

        if (person.getOccurrences().isEmpty()) {

            personRepo.delete(person);

        } else {

            person.setHidden(true);
            personRepo.save(person);

        }

        return "redirect:/personTable";

    }

}
