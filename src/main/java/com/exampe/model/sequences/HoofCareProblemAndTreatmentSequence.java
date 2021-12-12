package com.exampe.model.sequences;

import com.exampe.enums.hoofCare.Hoof;
import com.exampe.enums.hoofCare.HoofCareShape;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.util.List;

@Getter
@Setter
@ToString
@Embeddable
public class  HoofCareProblemAndTreatmentSequence {

    @Enumerated(EnumType.STRING)
    private Hoof hoof;

    @Enumerated(EnumType.STRING)
    private HoofCareShape shape;

    private String problemId;
    private String treatmentId;

}

