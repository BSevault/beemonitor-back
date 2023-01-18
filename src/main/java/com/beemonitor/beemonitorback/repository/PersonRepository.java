package com.beemonitor.beemonitorback.repository;

import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.Person;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface PersonRepository extends CrudRepository<Person, Long> {}