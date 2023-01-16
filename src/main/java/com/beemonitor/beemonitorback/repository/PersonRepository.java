package com.beemonitor.beemonitorback.repository;

import com.beemonitor.beemonitorback.model.Person;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface PersonRepository extends CrudRepository<Person, Long> {}