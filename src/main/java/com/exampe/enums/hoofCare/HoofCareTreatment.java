package com.exampe.enums.hoofCare;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HoofCareTreatment {

    NONE("None"),
    BANDAGE("Bandage"),
    BANDAGE_WITH_SALICYLIC_ACID("Bandage With Salicylic Acid"),
    BLOCK("Block"),
    DRAINAGE("Drainage"),
    TAR("Tar");

    private final String text;
}
