package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum FoodType {

    CONVENTIONAL("Conventional"),
    NORMAL("Normal");

    private final String text;

}
