package com.exampe.model.occurrence;

import com.exampe.enums.hoofCare.Hoof;
import com.exampe.enums.hoofCare.HoofCareShape;
import com.exampe.model.Medicine;
import com.exampe.model.OccurrenceExtraInfo;
import com.exampe.model.Person;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class HoofCareInfo {

    private Hoof hoof;
    private HoofCareShape shape;
    private List<OccurrenceExtraInfo> problem;
    private List<OccurrenceExtraInfo> treatment;

}
