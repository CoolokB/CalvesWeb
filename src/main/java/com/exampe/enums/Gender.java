package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Getter
@AllArgsConstructor
public enum Gender {

    FEMALE("Female"),
    MALE("Male");

    private String text;

}