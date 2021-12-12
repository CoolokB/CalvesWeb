package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum InseminationType {

    EASY("Easy"),
    DIFFICULT("Difficult"),
    IN_CERVIX("In Cervix"),
    BEFORE_CERVIX("Before Cervix"),
    ALREADY_PREGNANT("Already Pregnant");

    private final String text;

}
