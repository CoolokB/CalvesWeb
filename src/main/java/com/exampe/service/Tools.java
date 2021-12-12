package com.exampe.service;

import com.exampe.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Tools {

    @Autowired
    private MedRepo medRepo;

    @Autowired
    private CalfRepo calfRepo;

    @Autowired
    private PersonRepo personRepo;

    @Autowired
    private BullRepo bullRepo;

    @Autowired
    private OccurrenceRepo occurrenceRepo;

    @Autowired
    private OccurrenceExtraInfoRepo occurrenceExtraInfoRepo;

    public void clearHidden(){

        medRepo.findAllInActive().forEach(m -> {

            if (m.isHidden() && m.getOccurrences().isEmpty()) {
                medRepo.delete(m);
            }

        });

        calfRepo.findAllInActive().forEach(calf -> {

            if (calf.isHidden() && calf.getChildren().isEmpty()) {
                calfRepo.delete(calf);
            }

        });

        personRepo.findAllInActive().forEach(p -> {

            if (p.isHidden() && p.getOccurrences().isEmpty()) {
                personRepo.delete(p);
            }

        });

        bullRepo.findAllInActive().forEach(b -> {

            if (b.isHidden() && b.getChildren().isEmpty()) {
                bullRepo.delete(b);
            }

        });

        occurrenceExtraInfoRepo.findAllInActive().forEach(o -> {

            if (o.isHidden() && o.getChildren().isEmpty()) {
                occurrenceExtraInfoRepo.delete(o);
            }

        });

        occurrenceRepo.findAllInActive().forEach(o -> {

            if (o.isHidden() && o.getCalving()==null) {
                occurrenceRepo.delete(o);
            }

        });

    }

}
