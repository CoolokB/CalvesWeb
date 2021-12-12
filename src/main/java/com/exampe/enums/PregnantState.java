package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PregnantState {

    UNKNOWN("Unknown"),
    PREGNANT("Pregnant"),
    NOT_PREGNANT("Not Pregnant");
    
    private final String text;
}
