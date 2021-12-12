package com.exampe.repos;

import com.exampe.model.Bull;
import com.exampe.model.Medicine;
import com.exampe.model.OccurrenceExtraInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BullRepo extends JpaRepository<Bull,Integer> {


    @Query(value = "SELECT * FROM Bull WHERE hidden = false ", nativeQuery = true)
    List<Bull> findAllActive();

    @Query(value = "SELECT * FROM Bull WHERE hidden = true ", nativeQuery = true)
    List<Bull> findAllInActive();

}
