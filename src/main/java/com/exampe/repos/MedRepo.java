package com.exampe.repos;

import com.exampe.model.Medicine;
import com.exampe.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MedRepo extends JpaRepository<Medicine,Integer> {

    @Query(value = "SELECT * FROM Medicine  WHERE hidden = false ", nativeQuery = true)
    List<Medicine> findAllActive();

    @Query(value = "SELECT * FROM Medicine  WHERE hidden = true ", nativeQuery = true)
    List<Medicine> findAllInActive();

}
