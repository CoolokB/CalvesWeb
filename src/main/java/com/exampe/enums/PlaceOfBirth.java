package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PlaceOfBirth {

    UNKNOWN("Unknown"),
    CALVING_BOX("Calving Box"),
    SICK_BOX("Sick Box"),
    COW_SHED_PASSAGE("Cowshed Passage"),
    YOUNG_STOCK_SHED("Young Stock Shed"),
    FIELD("Field");

    private final String text;

}
