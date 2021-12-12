package com.exampe.model;

import com.exampe.enums.MedicineType;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class Medicine {

    @Id
    @GeneratedValue
    private int id;

    private String name;
    private String withdrawalSlaughter;
    private String withdrawalMilkNormal;
    private String calvingLessX;
    private String calvingFromX;
    private String calvingToX;
    private String calvingMoreX;
    private String milkLessX;
    private String milkFromToX;
    private String milkMoreX;

    @Enumerated(EnumType.STRING)
    private MedicineType type;

    @Lob
    private String link;

    private boolean hidden;

    @ManyToMany(mappedBy = "medicineList",
            cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<Occurrence> occurrences;

}
