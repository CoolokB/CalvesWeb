package com.exampe.model.occurrence;

import com.exampe.model.Medicine;
import com.exampe.model.Person;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.GeneratedValue;
import java.time.LocalDate;

@Getter
@Setter
public class MedicineInfo {

    private Person person;
    private Medicine medicine;

    private String amount;

    private String untilMilkDays;
    private String untilSlaughterDays;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilMilk;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilSlaughter;

}
