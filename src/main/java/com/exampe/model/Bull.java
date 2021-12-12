package com.exampe.model;

import com.exampe.enums.BullBreed;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Bull {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    @Enumerated(EnumType.STRING)
    private BullBreed bullBreed;

    @Lob
    private String link;

    private boolean hidden;

    @OneToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            mappedBy = "father",
            fetch = FetchType.LAZY)
    private List<Calf> children;

    @OneToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            mappedBy = "bull",
            fetch = FetchType.LAZY)
    private List<Occurrence> occurrences;
}
