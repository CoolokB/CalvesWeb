package com.exampe.enums.hoofCare;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HoofCareMovement {

    NORMAL("Normal"),
    WALKS_WITH_ROUND_BACK("Walks With Round Back"),
    STANDS_WITH_ROUND_BACK("Stands With Round Back");

    private final String text;

}