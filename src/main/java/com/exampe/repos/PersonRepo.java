package com.exampe.repos;

import com.exampe.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PersonRepo extends JpaRepository<Person, Integer> {

    @Query(value = "SELECT * FROM Person  WHERE hidden = false ", nativeQuery = true)
    List<Person> findAllActive();

    @Query(value = "SELECT * FROM Person  WHERE hidden = true ", nativeQuery = true)
    List<Person> findAllInActive();

}
