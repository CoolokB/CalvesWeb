package com.exampe.model.occurrence;

import com.exampe.model.Occurrence;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@Entity
public class Prophylactic extends Occurrence {

    private String reason;
    private String medicine;
    private String amount;

    @Transient
    private String occurrence = "Prophylactic";

    @Lob
    private String notes = "";

    private String daysMilk = "";
    private String daysSlaughter = "";
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilMilk;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate untilSlaughter;

}
