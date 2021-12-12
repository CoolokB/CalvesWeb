package com.exampe.service;

import com.exampe.enums.*;
import com.exampe.model.Calf;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateService {

    public static int calculateAge(LocalDate occurrenceDate, LocalDate birthDate) {

        return (int) (ChronoUnit.DAYS.between(birthDate, occurrenceDate));
    }

    public static void setPlaceOfHabitatDates(Calf calf) {

        int size = calf.getPlaces().size();

        if (size == 1) {

            calf.getPlaces().get(0).setEndDate(null);

        }
        else {
            for (int i = size - 2; i >= 0; i--) {

                calf.getPlaces().get(i).setEndDate(calf.getPlaces().get(i + 1).getStartDate());

            }
        }

    }


    public static LocalDate calculateWithdrawal(String daysString, LocalDate occurrenceDate) {

        LocalDate withdrawalDate;

        int days = Integer.parseInt(daysString);

        if (days <= 2) {
            withdrawalDate = occurrenceDate.plusDays(days + 2);
        }
        else withdrawalDate = occurrenceDate.plusDays(days * 2);

        return withdrawalDate;

    }

}
