package com.exampe.repos;

import com.exampe.model.Occurrence;
import com.exampe.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OccurrenceRepo extends JpaRepository<Occurrence,Integer> {

    @Query(value = "SELECT * FROM Occurrence  WHERE hidden = false ", nativeQuery = true)
    List<Occurrence> findAllActive();

    @Query(value = "SELECT * FROM Occurrence  WHERE hidden = true ", nativeQuery = true)
    List<Occurrence> findAllInActive();

}
