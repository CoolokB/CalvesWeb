package com.exampe.model.occurrence;

import com.exampe.model.Calf;
import com.exampe.model.Occurrence;
import com.exampe.model.OccurrenceExtraInfo;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
public class Sell extends Occurrence {

    @Lob
    private String about = "";

//    @ManyToMany(cascade = CascadeType.ALL)
//    private List<OccurrenceExtraInfo> OEISet = new ArrayList<>();

    @Transient
    private String occurrence = "Sell";
    private String whoTo;

    @OneToOne(fetch = FetchType.LAZY)
    private Calf calf;

}
