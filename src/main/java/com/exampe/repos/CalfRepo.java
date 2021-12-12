package com.exampe.repos;

import com.exampe.model.Calf;
import com.exampe.model.Occurrence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CalfRepo extends JpaRepository<Calf, Integer> {

    @Query(value = "SELECT * FROM Calf  WHERE hidden = false ", nativeQuery = true)
    List<Calf> findAllActive();

    @Query(value = "SELECT * FROM Calf  WHERE hidden = true ", nativeQuery = true)
    List<Calf> findAllInActive();

}
