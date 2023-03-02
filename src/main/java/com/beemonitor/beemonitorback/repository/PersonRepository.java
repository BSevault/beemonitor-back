package com.beemonitor.beemonitorback.repository;

import com.beemonitor.beemonitorback.model.PersonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepository extends JpaRepository<PersonEntity, Long> {}