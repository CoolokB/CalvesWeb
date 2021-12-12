package com.exampe.model;

import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;

import java.time.LocalDate;


public class FeedControl {

    private int id;

    private SimpleObjectProperty<LocalDate> start = new SimpleObjectProperty<>();
    private SimpleObjectProperty<LocalDate> end = new SimpleObjectProperty<>();
    private SimpleStringProperty place = new SimpleStringProperty("");
    private SimpleStringProperty foodType = new SimpleStringProperty("Conventional");
    private SimpleStringProperty field = new SimpleStringProperty("");

}