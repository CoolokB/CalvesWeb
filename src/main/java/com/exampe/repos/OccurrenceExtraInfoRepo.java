package com.exampe.repos;

import com.exampe.model.OccurrenceExtraInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OccurrenceExtraInfoRepo extends JpaRepository<OccurrenceExtraInfo, Integer> {

    @Query(value = "SELECT * FROM occurrence_extra_info  WHERE hidden = false ", nativeQuery = true)
    List<OccurrenceExtraInfo> findAllActive();

    @Query(value = "SELECT * FROM occurrence_extra_info  WHERE hidden = true ", nativeQuery = true)
    List<OccurrenceExtraInfo> findAllInActive();
}
