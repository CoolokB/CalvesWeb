package com.exampe.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class  Bulling {

    @Id
    @GeneratedValue
    protected int id;


    @ManyToOne(fetch = FetchType.LAZY)
    private Calf calf;

}
