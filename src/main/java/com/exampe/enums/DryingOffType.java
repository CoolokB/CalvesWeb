package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DryingOffType {

    DRYING_OFF("Drying Off"),
    MILKING_AGAIN("Milking Again");

    private final String text;
}
