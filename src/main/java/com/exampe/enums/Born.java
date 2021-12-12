package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Born {

    UNKNOWN("Unknown"),
    WITHOUT_HELP("Without help"),
    WITH_HELP("With help"),
    VETERINARY_HELP("Veterinary help");

    private final String text;

}
