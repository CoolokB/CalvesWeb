package com.exampe.repos;

import com.exampe.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Integer> {

    User findByUsername(String username);
    User findByActivationCode(String code);

}
