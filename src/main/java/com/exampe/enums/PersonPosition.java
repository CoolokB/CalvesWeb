package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PersonPosition {

    VET("Vet"),
    FARM_WORKER("Farm Worker"),
    ANIMAL_TECHNICIAN("Animal Technician"),
    HOOF_TRIMMER("Hoof Trimmer");

    private final String Text;

}
