package com.exampe.model.sequences;

import com.exampe.model.Medicine;
import com.exampe.model.Person;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.Embeddable;
import javax.persistence.Transient;
import java.time.LocalDate;

@Getter
@Setter
@ToString
@Embeddable
public class MedicineInputSequence {

    private int medicineId;
    private int personId;

    @Transient
    private Medicine medicine;

    @Transient
    private Person person;

    private String amount;

    private String untilMilkDays;
    private String untilSlaughterDays;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilMilk;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilSlaughter;


}

