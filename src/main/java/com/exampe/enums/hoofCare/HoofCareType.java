package com.exampe.enums.hoofCare;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HoofCareType {
    TRIMMING("Trimming"),
    INSPECTION("Inspection");

    private final String text;

}
