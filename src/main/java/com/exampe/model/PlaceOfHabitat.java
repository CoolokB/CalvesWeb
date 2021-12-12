package com.exampe.model;

import com.exampe.enums.FoodType;
import com.exampe.enums.PlaceOfHabitatName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.time.LocalDate;

@Data
@Embeddable
public class PlaceOfHabitat {

    @Enumerated(EnumType.STRING)
    private PlaceOfHabitatName place;

    @Enumerated(EnumType.STRING)
    private FoodType foodType = FoodType.NORMAL;

    private String grazing_field_number = "";

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

}
