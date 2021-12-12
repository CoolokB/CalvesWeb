package com.exampe.enums.death;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DeathReason {

    DECREASED_FERTILITY("Decreased Fertility"),
    MASTITIS("Mastitis"),
    TEAT_DAMAGE("Teat Damage"),
    DIFFICULTY_GIVING_BIRTH("Difficulty Giving Birth"),
    MILK_FEVER("Milk Fever"),
    HOOF_ILLNESS("Hoof Illness"),
    LEG_PROBLEMS("Leg Problems"),
    ABORTION("Abortion"),
    HIGH_AGE("High Age"),
    LOW_MILK_YIELD("Low Milk Yield"),
    TEMPERAMENT_DISORDER("Temperament Disorder"),
    ACCIDENT("Accident"),
    EATING_DISORDER_OR_KETOSIS("Eating Disorder/Ketosis"),
    OTHER_ILLNESS("Other Illness"),
    DIFFICULTY_MILKING_EXTERIOR("Difficulty Milking Exterior"),
    DIFFICULTY_MILKING_LETTING_DOWN("Difficulty Milking Letting Down"),
    ABNORMAL_UDDER_OR_TEAT("Abnormal Udder/Teat"),
    BVD("BVD"),
    HIGH_CELLCOUNT("High Cellcount"),
    BEEF_BREED("Beef Breed"),
    MALE("Male"),
    OTHER("Other");

    private final String text;

}
