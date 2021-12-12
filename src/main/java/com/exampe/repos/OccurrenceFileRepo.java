package com.exampe.repos;

import com.exampe.model.OccurrenceFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OccurrenceFileRepo extends JpaRepository<OccurrenceFile, Integer> {

    OccurrenceFile getByFileName(String fileName);
}
