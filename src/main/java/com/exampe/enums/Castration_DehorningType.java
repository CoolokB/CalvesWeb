package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Castration_DehorningType {

    DEHORNING("Dehorning"),
    CASTRATION("Castration"),
    CASTRATION_AND_DEHORNING("Castration and Dehorning");

    private final String text;
}
