package com.exampe.model;

import com.exampe.enums.ExtraInfoField;
import com.exampe.enums.OccurrenceType;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class OccurrenceExtraInfo {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    private boolean hidden;

    @Enumerated(EnumType.STRING)
    private OccurrenceType parent;

    @Enumerated(EnumType.STRING)
    private ExtraInfoField extraInfoField;

    @ManyToMany(mappedBy = "OEIList",
            cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<Occurrence> children;

    public OccurrenceType getOccurrenceType() {
        return parent;
    }

    public String getParent() {

        return parent.getText();

    }

}
