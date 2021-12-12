package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum InseminationPerson {

    DIY_AI("Diy AI"),
    AI("AI"),
    BULL("Bull");

    private final String text;

}
