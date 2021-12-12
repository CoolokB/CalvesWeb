package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum InseminationStatus {

    OPEN("Open"),
    INSEMINATED("Inseminated"),
    PREGNANT("Pregnant");

    private final String text;

}
