package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Birth {

    UNKNOWN("Unknown"),
    NORMAL("Normal"),
    BREACH("Breach"),
    TWISTED_UTERUS("Twisted Uterus"),
    LIMB_WRONG("Limb Wrong");

    private final String text;


}
