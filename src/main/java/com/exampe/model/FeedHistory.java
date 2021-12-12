package com.exampe.model;

import lombok.Data;

import javax.persistence.Embeddable;
import java.time.LocalDate;

@Data
@Embeddable
public class FeedHistory {

    private LocalDate start = LocalDate.now();
    private LocalDate end = LocalDate.now();
    private LocalDate withdrawalMilk = LocalDate.now();
    private LocalDate withdrawalSlaughter = LocalDate.now();
    private String place = "";
    private String foodType = "Conventional";
    private String field = "";

}

