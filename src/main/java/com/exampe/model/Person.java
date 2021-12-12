package com.exampe.model;

import com.exampe.enums.PersonPosition;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.parameters.P;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class Person {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    private boolean hidden;

    @Enumerated(EnumType.STRING)
    private PersonPosition personPosition;

    @ManyToMany(mappedBy = "personList",
            cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<Occurrence> occurrences;

}
