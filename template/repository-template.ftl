package com.dr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ${packageName}.model.${name};

@Repository
public interface ${name}Repository extends JpaRepository<${name}, Long> {

}
