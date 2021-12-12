package com.exampe.model.sequences;

import com.exampe.enums.*;
import com.exampe.model.Calf;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;
import java.time.LocalDate;

@Getter
@Setter
@Embeddable
public class CalvingSequence {

    private String dateOfBirth;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate bDate;

    private int calfId;
    private int dbId;

    @Enumerated(EnumType.STRING)
    private PlaceOfBirth placeOfBirth;

    @Enumerated(EnumType.STRING)
    private Born born;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Enumerated(EnumType.STRING)
    private Status status;

    @Enumerated(EnumType.STRING)
    private ColostrumByBottle colostrum;

    private String birth;

}

