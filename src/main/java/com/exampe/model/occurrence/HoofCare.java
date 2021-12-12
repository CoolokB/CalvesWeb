package com.exampe.model.occurrence;

import com.exampe.enums.hoofCare.HoofCareMovement;
import com.exampe.enums.hoofCare.HoofCareProblem;
import com.exampe.enums.hoofCare.HoofCareShape;
import com.exampe.enums.hoofCare.HoofCareTreatment;
import com.exampe.model.Occurrence;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
public class HoofCare extends Occurrence {

    @Lob
    private String notes;

    @Transient
    private String occurrence = "Hoof Care";

    private boolean fl;
    private boolean fr;
    private boolean rl;
    private boolean rr;

    @Enumerated(EnumType.STRING)
    private HoofCareShape shape;

    @Enumerated(EnumType.STRING)
    private HoofCareMovement movement;

    @Enumerated(EnumType.STRING)
    private HoofCareProblem problem;

    @Enumerated(EnumType.STRING)
    private HoofCareTreatment flTreatment;

    @Enumerated(EnumType.STRING)
    private HoofCareTreatment frTreatment;

    @Enumerated(EnumType.STRING)
    private HoofCareTreatment rlTreatment;

    @Enumerated(EnumType.STRING)
    private HoofCareTreatment rrTreatment;

}
