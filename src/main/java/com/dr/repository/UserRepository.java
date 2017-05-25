package com.dr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dr.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
