package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ExtraInfoField {

    ACCIDENT_ILLNESS_OCCURRENCE("Accident/Illness Occurrence", OccurrenceType.ACCIDENT_ILLNESS),

    SELL_WHO_TO("Sell Who To", OccurrenceType.SELL),
    SELL_OTHER("Sell Other", OccurrenceType.SELL),

    DEATH_VETERINARY_NOTES("Death Veterinary Notes", OccurrenceType.DEATH),
    DEATH_CAUSE("Death Cause", OccurrenceType.DEATH),
    DEATH_WHERE_TO("Death Where To", OccurrenceType.DEATH),

    FOOT_BATH_PROBLEM("Foot Bath Problem", OccurrenceType.FOOT_BATH),
    FOOT_BATH_CHEMICAL("Foot Bath Chemical", OccurrenceType.FOOT_BATH),
    FOOT_BATH_OTHER("Foot Bath Other", OccurrenceType.FOOT_BATH),

    PROPHYLACTIC_REASON("Prophylactic Reason", OccurrenceType.PROPHYLACTIC),
    PROPHYLACTIC_OTHER("Prophylactic Other", OccurrenceType.PROPHYLACTIC),

    HOOF_CARE_OTHER("Hoof Care Other", OccurrenceType.HOOF_CARE),
    HOOF_CARE_PROBLEM("Hoof Care Problem", OccurrenceType.HOOF_CARE),
    HOOF_CARE_TREATMENT("Hoof Care Treatment", OccurrenceType.HOOF_CARE),

    CALVING_EXTRA("Calving Extra", OccurrenceType.CALVING),
    CASTRATION_DEHORNING_EXTRA("Castration/Dehorning Extra", OccurrenceType.CASTRATION_DEHORNING),
    CONDITION_SCORE_EXTRA("Condition Score Extra", OccurrenceType.CONDITION_SCORE),
    DRYING_OFF_EXTRA("Drying Off Extra", OccurrenceType.DRYING_OFF),
    INSEMINATION_EXTRA("Insemination Extra", OccurrenceType.INSEMINATION),
    MILK_YIELD_EXTRA("Milk Yield Extra", OccurrenceType.MILK_YIELD),
    PREGNANCY_TEST_EXTRA("Pregnancy Test Extra", OccurrenceType.PREGNANCY_TEST),
    TEMPERAMENT_EXTRA("Temperament Extra", OccurrenceType.TEMPERAMENT),
    WEANING_EXTRA("Weaning Extra", OccurrenceType.WEANING);

    private final String text;
    private final OccurrenceType type;

}
