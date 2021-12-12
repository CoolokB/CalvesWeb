package com.exampe.controller;

import com.exampe.enums.PlaceOfHabitatName;
import com.exampe.model.Calf;
import com.exampe.model.PlaceOfHabitat;
import com.exampe.repos.CalfRepo;
import com.exampe.service.DateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PlaceOfHabitatController {

    @Autowired
    private CalfRepo calfRepo;

    @PostMapping("/addPlace")
    public String addPlace(PlaceOfHabitat place, @RequestParam("ids") Calf calf) {
        List<PlaceOfHabitat> places = calf.getPlaces();
        places.add(place);

        if (places.size()>1){
            places.get(places.size() - 2).setEndDate(place.getStartDate());
        }

        calfRepo.save(calf);
        return "redirect:/edit/" + calf.getId()+"#habitat/";
    }

    @GetMapping("/deletePlace")
    public String deletePlace(@RequestParam int id, @RequestParam Calf calf) {

        calf.getPlaces().remove(id);
        DateService.setPlaceOfHabitatDates(calf);

        return "redirect:/edit/" + calf.getId()+"#habitat/";
    }

    @GetMapping("/editPlace")
    public String editPlace(@RequestParam int id, @RequestParam Calf calf, Model model) {

        PlaceOfHabitat place = calf.getPlaces().get(id);

        model.addAttribute("calf", calf);
        model.addAttribute("place", place);
        model.addAttribute("placeOfHabitatList", PlaceOfHabitatName.values());

        if (calf.getPlaces().size()>1) {
            List<PlaceOfHabitat> places = calf.getPlaces();
            PlaceOfHabitat previousPlace = places.get(places.size() - 1);
            model.addAttribute("lastStartDate", previousPlace.getStartDate());
        }

//        DateService.setAttributes(model, calfRepo.findAll());
        return "calfEditing/placeOfHabitat/placeEditing";

    }

    @PostMapping("/editPlace")
    public String editPlace(@RequestParam int id, @RequestParam Calf calf, PlaceOfHabitat place) {

        calf.getPlaces().set(id,place);
        DateService.setPlaceOfHabitatDates(calf);

        return "redirect:/edit/" + calf.getId()+"#habitat/";

    }

}
