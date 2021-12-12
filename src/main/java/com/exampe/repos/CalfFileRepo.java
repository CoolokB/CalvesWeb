package com.exampe.repos;

import com.exampe.model.CalfFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CalfFileRepo extends JpaRepository<CalfFile, Integer> {

    CalfFile getByFileName(String fileName);
}
