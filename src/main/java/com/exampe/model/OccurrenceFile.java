package com.exampe.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@Entity
public class OccurrenceFile {

    @Id
    @GeneratedValue
    private int id;

    private String fileOriginalName;

    private String fileName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @ManyToOne(fetch = FetchType.LAZY)
    private Occurrence occurrence;

}
