package com.exampe.controller;

import com.exampe.enums.*;
import com.exampe.model.Calf;
import com.exampe.repos.CalfRepo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MultiplySelectionController {

    @Autowired
    private CalfRepo calfRepo;

    @PostMapping("/showDates")
    public String showDates(String result) throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();

        FilterParameters filterParameters = objectMapper.readValue(result, FilterParameters.class);

        System.out.println(filterParameters);

        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");

        List<Calf> filteredList = calfRepo.findAll();

//        filteredList = filterAccidentOccurrence(filterParameters, filteredList, timeFormatter);
//        filteredList = filterCalvingOccurrence(filterParameters, filteredList, timeFormatter);
//        filteredList = filterCastrationDehorningOccurrence(filterParameters, filteredList, timeFormatter);
//        filteredList = filterConditionScoreOccurrence(filterParameters, filteredList, timeFormatter);

        if (filterParameters.birthDateFrom != null && filterParameters.birthDateTo != null) {

            LocalDate dateFrom = LocalDate.parse(filterParameters.birthDateFrom, timeFormatter);
            LocalDate dateTo = LocalDate.parse(filterParameters.birthDateTo, timeFormatter);

            filteredList = filteredList.stream().filter
                    (c -> (c.getBirthDate().isEqual(dateFrom) || c.getBirthDate().isAfter(dateFrom)) &&
                            (c.getBirthDate().isEqual(dateTo) || c.getBirthDate().isBefore(dateTo))
                    ).collect(Collectors.toList());

        }
        if (filterParameters.getAgeFrom() != 0 && filterParameters.getAgeTo() != 0) {

            int ageFrom = filterParameters.getAgeFrom();
            int ageTo = filterParameters.getAgeTo();

//            filteredList = filteredList.stream().filter(
//                    c -> Integer.parseInt(c.getRealAge()) >= ageFrom && Integer.parseInt(c.getRealAge()) <= ageTo)
//                    .collect(Collectors.toList());

        }
        if (filterParameters.getStatus() != null) {

            filteredList = filterStatus(filterParameters, filteredList);

        }

        if (filterParameters.getQuantity() != null) {

            filteredList = filterQuantity(filterParameters, filteredList);

        }
        if (filterParameters.getGender() != null) {

            filteredList = filterGender(filterParameters, filteredList);

        }
        if (filterParameters.getPlaceOfBirth() != null) {

            filteredList = filterPlaceOfBirth(filterParameters, filteredList);

        }
        if (filterParameters.getBirth() != null) {

            filteredList = filterBirth(filterParameters, filteredList);

        }
        if (filterParameters.getBorn() != null) {

            filteredList = filterBorn(filterParameters, filteredList);

        }
        if (filterParameters.getColostrum() != null) {

            filteredList = filterColostrum(filterParameters, filteredList);

        }

        filteredList.forEach(c -> System.out.println(c.getCalfId()));

        return "redirect:/mainTable";

    }

//    private static List<Calf> filterCastrationDehorningOccurrence(FilterParameters filterParameters, List<Calf> filteredList, DateTimeFormatter timeFormatter) {
//
//        List<Calf> tempList = filteredList;
//
//        if (filterParameters.getCastrationDehorningType() != null) {
//            System.out.println("Here");
//            tempList = tempList.stream().filter(c -> {
//
//                for (Castration_DehorningType castrationType : filterParameters.getCastrationDehorningType()) {
//
//                    for (Castration_Dehorning casDeh : c.getCastrationList()) {
//
//                        if (casDeh.getType().equals(castrationType)) {
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCastrationAgeFrom() != 0 && filterParameters.getCastrationAgeTo() != 0) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Castration_Dehorning casDeh : c.getCastrationList()) {
//
//                    int age = casDeh.getAge();
//
//                    int ageFrom = filterParameters.castrationAgeFrom;
//
//                    int ageTo = filterParameters.castrationAgeTo;
//
//                    if (age >= ageFrom && age <= ageTo) {
//
//                        return true;
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCastrationDateFrom() != null && filterParameters.getCastrationDateTo() != null) {
//
//            LocalDate dateFrom = LocalDate.parse(filterParameters.getCastrationDateFrom(), timeFormatter);
//
//            LocalDate dateTo = LocalDate.parse(filterParameters.getCastrationDateTo(), timeFormatter);
//
//            tempList = filteredList.stream().filter
//
//                    (
//                            c -> {
//
//                                for (Castration_Dehorning castrationDehorning : c.getCastrationList()) {
//
//                                    LocalDate date = castrationDehorning.getDate();
//
//                                    if ((date.isEqual(dateFrom) || date.isAfter(dateFrom)) &&
//                                            (date.isEqual(dateTo) || date.isBefore(dateTo))) {
//
//                                        return true;
//                                    }
//
//                                }
//
//                                return false;
//
//                            }
//
//                    ).
//                    collect(Collectors.toList());
//
//        }
//
//        return tempList;
//
//    }

//    private static List<Calf> filterConditionScoreOccurrence(FilterParameters filterParameters, List<Calf> filteredList, DateTimeFormatter timeFormatter) {
//
//        List<Calf> tempList = filteredList;
//
//        if (filterParameters.getConditionScoreScoreList() != null) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Double score : filterParameters.getConditionScoreScoreList()) {
//
//                    for (ConditionScore conditionScore : c.getConditionScoreList()) {
//
//                        if (conditionScore.getScore() == score) {
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//
//        return tempList;
//
//    }

//    private static List<Calf> filterWeaningOccurrence(FilterParameters filterParameters, List<Calf> filteredList, DateTimeFormatter timeFormatter) {
//
//        List<Calf> tempList = filteredList;
//
//        if (filterParameters.getConditionScoreScoreList() != null) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Double score : filterParameters.getConditionScoreScoreList()) {
//
//                    for (ConditionScore conditionScore : c.getConditionScoreList()) {
//
//                        if (conditionScore.getScore() == score) {
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//
//        return tempList;
//
//    }

    //Complete

    private static List<Calf> filterStatus(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (Status status : filterParameters.getStatus()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getStatus().equals(status)).collect(Collectors.toList()));

        }

        return tempList;

    }


    private static List<Calf> filterQuantity(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (Quantity quantity : filterParameters.getQuantity()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getQuantity().equals(quantity)).collect(Collectors.toList()));

        }

        return tempList;

    }

    private static List<Calf> filterGender(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (Gender gender : filterParameters.getGender()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getGender().equals(gender)).collect(Collectors.toList()));

        }

        return tempList;

    }

    private static List<Calf> filterPlaceOfBirth(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (PlaceOfBirth placeOfBirth : filterParameters.getPlaceOfBirth()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getBirthPlace().equals(placeOfBirth)).collect(Collectors.toList()));

        }

        return tempList;

    }

    private static List<Calf> filterBirth(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (Birth birth : filterParameters.getBirth()) {

//            tempList.addAll(filteredList.stream().filter(c -> c.getBirth().equals(birth)).collect(Collectors.toList()));

        }

        return tempList;

    }

    private static List<Calf> filterBorn(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (Born born : filterParameters.getBorn()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getBorn().equals(born)).collect(Collectors.toList()));

        }

        return tempList;

    }

    private static List<Calf> filterColostrum(FilterParameters filterParameters, List<Calf> filteredList) {

        List<Calf> tempList = new ArrayList<>();

        for (ColostrumByBottle colostrum : filterParameters.getColostrum()) {

            tempList.addAll(filteredList.stream().filter(c -> c.getColostrum().equals(colostrum)).collect(Collectors.toList()));

        }

        return tempList;

    }


//    private static List<Calf> filterAccidentOccurrence(FilterParameters filterParameters, List<Calf> filteredList, DateTimeFormatter timeFormatter) {
//
//        List<Calf> tempList = filteredList;
//
//        if (filterParameters.getAccidentName() != null) {
//
//            if (filterParameters.accidentToggle) {
//
//                tempList = tempList.stream().filter(c -> {
//
//                    int count = 0;
//
//                    Set<AccidentName> alreadyFiltered = new HashSet<>();
//
//                    for (AccidentName accidentName : filterParameters.getAccidentName()) {
//
//                        for (Accident accident : c.getAccidentList()) {
//
//                            if (accident.getAccidentName().equals(accidentName)) {
//
//                                if (!alreadyFiltered.contains(accidentName)) {
//
//                                    count++;
//
//                                }
//
//                                alreadyFiltered.add(accidentName);
//
//                            }
//
//                        }
//
//                    }
//
//                    return count == filterParameters.getAccidentName().size();
//
//                }).collect(Collectors.toList());
//
//            } else
//
//                tempList = tempList.stream().filter(c -> {
//
//                    for (AccidentName accidentName : filterParameters.getAccidentName()) {
//
//                        for (Accident accident : c.getAccidentList()) {
//
//                            if (accident.getAccidentName().equals(accidentName)) {
//                                return true;
//                            }
//
//                        }
//
//                    }
//
//                    return false;
//
//                }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getAccidentMedicine() != null) {
//
//            if (filterParameters.accidentMedicineToggle) {
//
//                tempList = tempList.stream().filter(c -> {
//
//                    int count = 0;
//
//                    Set<String> alreadyFiltered = new HashSet<>();
//
//                    for (String medicineName : filterParameters.getAccidentMedicine()) {
//
//                        for (Accident accident : c.getAccidentList()) {
//
////                            if (accident.getMedicine().replace(" ", "").equals(medicineName)) {
////
////                                if (!alreadyFiltered.contains(medicineName)) {
////
////                                    count++;
////
////                                }
////
////                                alreadyFiltered.add(medicineName);
////
////                            }
//
//                        }
//
//                    }
//
//                    return count == filterParameters.getAccidentMedicine().size();
//
//                }).collect(Collectors.toList());
//
//            } else
//
//                tempList = tempList.stream().filter(c -> {
//
//                    for (Accident accident : c.getAccidentList()) {
//
//                        for (String medicineName : filterParameters.getAccidentMedicine()) {
//
////                            if (accident.getMedicine().replace(" ", "").equals(medicineName)) {
////                                return true;
////                            }
//                        }
//
//                    }
//
//                    return false;
//
//                }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getAccidentAgeFrom() != 0 && filterParameters.getAccidentAgeTo() != 0) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Accident accident : c.getAccidentList()) {
//
//                    int age = accident.getAge();
//
//                    int ageFrom = filterParameters.accidentAgeFrom;
//
//                    int ageTo = filterParameters.accidentAgeTo;
//
//                    if (age >= ageFrom && age <= ageTo) {
//
//                        return true;
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getAccidentDateFrom() != null && filterParameters.getAccidentDateTo() != null) {
//
//            LocalDate dateFrom = LocalDate.parse(filterParameters.getAccidentDateFrom(), timeFormatter);
//
//            LocalDate dateTo = LocalDate.parse(filterParameters.getAccidentDateTo(), timeFormatter);
//
//            tempList = filteredList.stream().filter
//
//                    (
//                            c -> {
//
//                                for (Accident accident : c.getAccidentList()) {
//
//                                    LocalDate date = accident.getDate();
//
//                                    if ((date.isEqual(dateFrom) || date.isAfter(dateFrom)) &&
//                                            (date.isEqual(dateTo) || date.isBefore(dateTo))) {
//
//                                        return true;
//                                    }
//
//                                }
//
//                                return false;
//
//                            }
//
//                    ).
//                    collect(Collectors.toList());
//
//        }
//
//        return tempList;
//
//    }

//    private static List<Calf> filterCalvingOccurrence(FilterParameters filterParameters, List<Calf> filteredList, DateTimeFormatter timeFormatter) {
//
//        List<Calf> tempList = filteredList;
//
//        if (filterParameters.getCalvingPlaceOfBirth() != null) {
//
//            if (filterParameters.calvingPlaceOfBirthToggle) {
//
//                tempList = tempList.stream().filter(c -> {
//
//                    int count = 0;
//
//                    Set<PlaceOfBirth> alreadyFiltered = new HashSet<>();
//
//                    for (PlaceOfBirth placeOfBirth : filterParameters.getCalvingPlaceOfBirth()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getPlaceOfBirth().equals(placeOfBirth)) {
//
//                                if (!alreadyFiltered.contains(placeOfBirth)) {
//
//                                    count++;
//
//                                }
//
//                                alreadyFiltered.add(placeOfBirth);
//
//                            }
//
//                        }
//
//                    }
//
//                    return count == filterParameters.getCalvingPlaceOfBirth().size();
//
//                }).collect(Collectors.toList());
//
//            } else
//
//                tempList = tempList.stream().filter(c -> {
//
//                    for (PlaceOfBirth placeOfBirth : filterParameters.getCalvingPlaceOfBirth()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getPlaceOfBirth().equals(placeOfBirth)) {
//                                return true;
//                            }
//                        }
//
//                    }
//
//                    return false;
//
//                }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingBorn() != null) {
//
//            if (filterParameters.calvingBornToggle) {
//
//                tempList = tempList.stream().filter(c -> {
//
//                    int count = 0;
//
//                    Set<Born> alreadyFiltered = new HashSet<>();
//
//                    for (Born born : filterParameters.getCalvingBorn()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getBorn().equals(born)) {
//
//                                if (!alreadyFiltered.contains(born)) {
//
//                                    count++;
//
//                                }
//
//                                alreadyFiltered.add(born);
//
//                            }
//
//                        }
//
//                    }
//
//                    return count == filterParameters.getCalvingBorn().size();
//
//                }).collect(Collectors.toList());
//
//            } else
//
//                tempList = tempList.stream().filter(c -> {
//
//                    for (Born born : filterParameters.getCalvingBorn()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getBorn().equals(born)) {
//                                return true;
//                            }
//                        }
//
//                    }
//
//                    return false;
//
//                }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingBirth() != null) {
//
//            if (filterParameters.calvingBirthToggle) {
//
//                tempList = tempList.stream().filter(c -> {
//
//                    int count = 0;
//
//                    Set<Birth> alreadyFiltered = new HashSet<>();
//
//                    for (Birth birth : filterParameters.getCalvingBirth()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getBirth().equals(birth)) {
//
//                                if (!alreadyFiltered.contains(birth)) {
//
//                                    count++;
//
//                                }
//
//                                alreadyFiltered.add(birth);
//
//                            }
//
//                        }
//
//                    }
//
//                    return count == filterParameters.getCalvingBirth().size();
//
//                }).collect(Collectors.toList());
//
//            } else
//
//                tempList = tempList.stream().filter(c -> {
//
//                    for (Birth birth : filterParameters.getCalvingBirth()) {
//
//                        for (Calving calving : c.getCalvingList()) {
//
//                            if (calving.getBirth().equals(birth)) {
//                                return true;
//                            }
//                        }
//
//                    }
//
//                    return false;
//
//                }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingQuantity() != null) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Quantity quantity : filterParameters.getCalvingQuantity()) {
//
//                    for (Calving calving : c.getCalvingList()) {
//
//                        if (calving.getQuantity().equals(quantity)) {
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingGender() != null) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Gender gender : filterParameters.getCalvingGender()) {
//
//                    for (Calving calving : c.getCalvingList()) {
//
//                        if (calving.getGender().equals(gender)) {
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingGestationFrom() != 0 && filterParameters.getCalvingGestationTo() != 0) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Calving calving : c.getCalvingList()) {
//
//                    if (!calving.getGestation().equals("")) {
//
//                        int gestation = Integer.parseInt(calving.getGestation());
//
//                        int gestationFrom = filterParameters.getCalvingGestationFrom();
//
//                        int gestationTo = filterParameters.getCalvingGestationTo();
//
//                        if (gestation >= gestationFrom && gestation <= gestationTo) {
//
//                            return true;
//                        }
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingAgeFrom() != 0 && filterParameters.getCalvingAgeTo() != 0) {
//
//            tempList = tempList.stream().filter(c -> {
//
//                for (Calving calving : c.getCalvingList()) {
//
//                    int age = calving.getAge();
//
//                    int ageFrom = filterParameters.calvingAgeFrom;
//
//                    int ageTo = filterParameters.calvingAgeTo;
//
//                    if (age >= ageFrom && age <= ageTo) {
//
//                        return true;
//                    }
//
//                }
//
//                return false;
//
//            }).collect(Collectors.toList());
//
//        }
//
//        if (filterParameters.getCalvingDateFrom() != null && filterParameters.getCalvingDateTo() != null) {
//
//            LocalDate dateFrom = LocalDate.parse(filterParameters.getCalvingDateFrom(), timeFormatter);
//
//            LocalDate dateTo = LocalDate.parse(filterParameters.getCalvingDateTo(), timeFormatter);
//
//            tempList = filteredList.stream().filter
//
//                    (
//                            c -> {
//
//                                for (Calving calving : c.getCalvingList()) {
//
//                                    LocalDate date = calving.getDate();
//
//                                    if ((date.isEqual(dateFrom) || date.isAfter(dateFrom)) &&
//                                            (date.isEqual(dateTo) || date.isBefore(dateTo))) {
//
//                                        return true;
//                                    }
//
//                                }
//
//                                return false;
//
//                            }
//
//                    ).
//                    collect(Collectors.toList());
//
//        }
//
//        return tempList;
//
//    }

}
