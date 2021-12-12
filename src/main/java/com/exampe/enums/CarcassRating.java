package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CarcassRating {

    E_PLUS("E+"),
    E("E"),
    E_MINUS("E-"),
    U_PLUS("U+"),
    U("U"),
    U_MINUS("U-"),
    R_PLUS("R+"),
    R("R"),
    R_MINUS("R-"),
    O_PLUS("O+"),
    O("O"),
    O_MINUS("O-"),
    P_PLUS("P+"),
    P("P"),
    P_MINUS("P-");

    private final String text;

}
