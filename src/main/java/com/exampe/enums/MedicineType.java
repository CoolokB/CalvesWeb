package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum MedicineType {

    NO_WITHDRAWAL("No Withdrawal"),
    NORMAL_WITHDRAWAL("Normal Withdrawal"),
    COMPLEX_WITHDRAWAL("Complex Withdrawal");

    private final String text;

}
