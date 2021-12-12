package com.exampe.enums.hoofCare;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HoofCareProblem {

    NONE("None"),
    DERMATITIS("Dermatitis"),
    DIGITAL_DERMATITIS("Digital Dermatitis"),
    HEEL_HORN_EROSION_SUPERFICIAL("Heel Horn Erosion Superficial"),
    HEEL_HORN_EROSION_DEEP("Heel Horn Erosion Deep"),
    SOLE_HAEMORRHAGE_SUPERFICIAL("Sole Haemorrhage Superficial"),
    SOLE_HAEMORRHAGE_DEEP("Sole Haemorrhage Deep"),
    SORE("Sore"),
    SORE_WITH_PUS("Sore With Pus"),
    ABSCESS("Abscess"),
    LEG_DAMAGE("Leg Damage"),
    FOREIGN_OBJECT("Foreign Object"),
    DOUBLE_SOLE("Double Sole"),
    LAMINITIS("Laminitis"),
    WHITE_LINE_SEPARATION("White Line Separation"),
    FOOT_ROT("Foot Rot"),
    INTERDIGITAL_FIBROMA("Interdigital Fibroma"),
    SAND_CRACK("Sand Crack"),
    TOE_ULCER("Toe Ulcer"),
    VERRUCOSE_DERMITITS("Verrucose Dermitits"),
    UNKNOWN("Unknown");

    private final String text;

}
