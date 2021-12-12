package com.exampe.repos;

import com.exampe.model.occurrence.Sell;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SellRepo extends JpaRepository<Sell,Integer> {

}
