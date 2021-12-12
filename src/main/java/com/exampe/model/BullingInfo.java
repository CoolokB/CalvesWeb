package com.exampe.model;

import com.exampe.enums.InseminationStatus;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
public class BullingInfo {

    private int days;
    private InseminationStatus status;

}
