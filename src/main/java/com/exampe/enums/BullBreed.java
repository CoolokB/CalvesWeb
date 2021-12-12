package com.exampe.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum BullBreed {

    SLB(BreedType.DAIRY),
    SRB(BreedType.DAIRY),
    SKB(BreedType.DAIRY),
    JER(BreedType.DAIRY),
    AA(BreedType.BEEF),
    CHAR(BreedType.BEEF),
    HER(BreedType.BEEF);

    private final BreedType breedType;

    enum BreedType{
        BEEF,DAIRY
    }
}
