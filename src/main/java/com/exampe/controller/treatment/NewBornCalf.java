package com.exampe.controller.treatment;

import com.exampe.enums.*;
import lombok.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Getter
@Setter
@ToString
public class NewBornCalf {

    private LocalDate calvingDate;
    private int newBornCalfId;
    private PlaceOfBirth placeOfBirth;
    private Born born;
    private List<Birth> births;
    private Gender gender;
    private Quantity quantity;
    private Status status;
//    private Breed breed;
    private ColostrumByBottle colostrum;
    int calvingInseminationId;
    int calvingDryingId;

    public void setCalvingDate(String date) {

        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        calvingDate = LocalDate.parse(date, timeFormatter);

    }

}

