package com.exampe.enums.hoofCare;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HoofCareShape {

    NORMAL("Normal"),
    ASYMMETRICAL("Asymmetrical"),
    CORKSCREW_CLAW("Corkscrew Claw"),
    SCISSOR_CLAW("Scissor Claw"),
    OVERGROWN_9CM("Overgrown 9 cm"),
    OVERGROWN_10CM("Overgrown 10 cm");

    private final String text;

}
