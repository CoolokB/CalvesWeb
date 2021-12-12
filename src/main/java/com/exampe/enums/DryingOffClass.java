package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DryingOffClass {

    ROUTINE("Routine"),TEAT("Teat");

    private final String text;

}
