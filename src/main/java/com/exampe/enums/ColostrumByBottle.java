package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Getter
@AllArgsConstructor
public enum ColostrumByBottle {

    UNKNOWN("Unknown"),
    ABSENT("Absent"),
    BOTTLE("Bottle"),
    COW("Cow");

    private final String text;

}
