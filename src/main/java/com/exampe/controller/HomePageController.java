package com.exampe.controller;

import com.exampe.enums.PlaceOfHabitatName;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController{

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/")
    public String greeting(Model model) {

        model.addAttribute("placeOfHabitatList", PlaceOfHabitatName.values());

        return "homePage/greeting";
    }

}
