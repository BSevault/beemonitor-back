package com.beemonitor.beemonitorback.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.Person;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface PersonRepository extends JpaRepository<Person, Long> {}