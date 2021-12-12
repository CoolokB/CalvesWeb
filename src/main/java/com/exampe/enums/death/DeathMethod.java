package com.exampe.enums.death;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum  DeathMethod {

    DEATH("Death"),
    EUTHANASIA("Euthanasia"),
    SLAUGHTER("Slaughter");

    private final String Text;
}
