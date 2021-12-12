package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum OccurrenceType {

    ACCIDENT_ILLNESS("Accident/Illness"),
    CALVING("Calving"),
    CASTRATION_DEHORNING("Castration/Dehorning"),
    CONDITION_SCORE("Condition Score"),
    DEATH("Death"),
    DRYING_OFF("Drying Off"),
    FOOT_BATH("Foot Bath"),
    HOOF_CARE("Hoof Care"),
    INSEMINATION("Insemination"),
    MILK_YIELD("Milk Yield 90 Days"),
    PREGNANCY_TEST("Pregnancy Test"),
    PROPHYLACTIC("Prophylactic"),
    SELL("Sell"),
    TEMPERAMENT("Temperament"),
    WEANING("Weaning");

    private final String text;

}
