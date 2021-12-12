package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Status {

    ALIVE("Alive"),
    DEAD("Dead"),
    SOLD("Sold");

    private final String text;

}
