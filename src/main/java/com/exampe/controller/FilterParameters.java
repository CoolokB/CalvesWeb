package com.exampe.controller;

import com.exampe.enums.*;
import com.exampe.enums.death.DeathMethod;
import com.exampe.enums.hoofCare.HoofCareMovement;
import com.exampe.enums.hoofCare.HoofCareShape;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FilterParameters {

    //Main Info
    String birthDateFrom;
    String birthDateTo;
    int ageFrom;
    int ageTo;
    List<Status> status;
//    List<Breed> breed;
    List<Quantity> quantity;
    List<Gender> gender;
    List<PlaceOfBirth> placeOfBirth;
    List<Birth> birth;
    List<Born> born;
    List<ColostrumByBottle> colostrum;
    List<PlaceOfHabitatName> placeOfHabitat;

    String placeOfHabitatDateFrom;
    String placeOfHabitatDateTo;

    //Accident Occurrence
    String accidentDateFrom;
    String accidentDateTo;
    boolean accidentToggle;
    boolean accidentMedicineToggle;
    int accidentAgeFrom;
    int accidentAgeTo;
    List<String> accidentMedicine;
//    List<AccidentName> accidentName;

    //Calving Occurrence
    boolean calvingBirthToggle;
    boolean calvingBornToggle;
    boolean calvingPlaceOfBirthToggle;
    List<PlaceOfBirth> calvingPlaceOfBirth;
    List<Birth> calvingBirth;
    List<Born> calvingBorn;
    List<Quantity> calvingQuantity;
    List<Gender> calvingGender;
    int calvingAgeFrom;
    int calvingAgeTo;
    int calvingGestationFrom;
    int calvingGestationTo;
    String calvingDateFrom;
    String calvingDateTo;

    //CastrationDehorning Occurrence
    List<Castration_DehorningType> castrationDehorningType;
    int castrationAgeFrom;
    int castrationAgeTo;
    String castrationDateFrom;
    String castrationDateTo;

    //ConditionScore
    List<Double> conditionScoreScoreList;

    //Death
    List<DeathMethod> deathMethodList;

    //Drying Off
    boolean dryingOffTeatToggle;
    int dryingOffDaysBeforeCalvingFrom;
    int dryingOffDaysBeforeCalvingTo;
    int dryingOffDaysAfterCalvingFrom;
    int dryingOffDaysAfterCalvingTo;
    List<String>dryingOffMedicine;
    String dryingOffDateFrom;
    String dryingOffDateTo;

    //FootBath
    String footBathChemical;
    String footBathDateFrom;
    String footBathDateTo;

    //HoofCare
    boolean hoofCareFeetToggle;
    List<Feet>hoofCareFoot;
    List<HoofCareMovement>hoofCareMovement;
    List<HoofCareShape>hoofCareShape;
    int hoofCareAgeFrom;
    int hoofCareAgeTo;
    String hoofCareDateFrom;
    String hoofCareDateTo;

    //Weaning
    int weaningAgeFrom;
    int weaningAgeTo;
    String weaningDateFrom;
    String weaningDateTo;

    //Sell
    String sellDateFrom;
    String sellDateTo;

    //Prophylactic
    int prophylacticAgeFrom;
    int prophylacticAgeTo;
    String prophylacticDateFrom;
    String prophylacticDateTo;

    //PregnancyTest
    List<PregnantState> pregnancyResult;
    int pregnancyDaysAfterInseminationFrom;
    int pregnancyDaysAfterInseminationTo;
    String pregnancyTestDateFrom;
    String pregnancyTestDateTo;

    //MilkYield
    boolean lactationNumberToggle;
    List<Integer> milkYieldLactationNumber;
    int lactationWeightFrom;
    int lactationWeightTo;
    String milkYieldDateFrom;
    String milkYieldDateTo;

    //Insemination
    List<BullBreed> inseminationBreed;
    List<InseminationType> inseminationType;
    List<InseminationPerson>inseminationPerson;
    List<PregnantState> inseminationPregnant;
    String inseminationBullName;
    String inseminationDateFrom;
    String inseminationDateTo;

}
