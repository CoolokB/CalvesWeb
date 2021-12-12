package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PregnancyMethod {

    TECHNICIAN("Technician"),
    ANALYSIS("Analysis"),
    OBSERVATION("Observation");

    private final String text;

}
