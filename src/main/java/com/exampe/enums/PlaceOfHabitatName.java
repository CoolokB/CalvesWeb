package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PlaceOfHabitatName {

    WITH_COW_CB("With Cow Cb"),
    WITH_COW_SB("With Cow Sb"),
    WITH_COW_F("With Cow F"),
    SINGLE_BOX("Single Box"),
    MILK_BOX_1("Milk Box 1"),
    MILK_BOX_2("Milk Box 2"),
    CALF_SHED("Calf Shed"),
    YOUNG_STOCK_SHED_1("Young Stock Shed 1"),
    YOUNG_STOCK_SHED_2("Young Stock Shed 2"),
    YOUNG_STOCK_SHED_3("Young Stock Shed 3"),
    YOUNG_STOCK_SHED_4("Young Stock Shed 4"),
    YOUNG_STOCK_SHED_5("Young Stock Shed 5"),
    YOUNG_STOCK_SHED_6("Young Stock Shed 6"),
    COW_SHED("Cow Shed"),
    ELECTRIC_FENCE_TRAINING("Electric Fence Training"),
    GRAZING_FIELD_NUMBER("Grazing Field Number");

    private final String text;

}
