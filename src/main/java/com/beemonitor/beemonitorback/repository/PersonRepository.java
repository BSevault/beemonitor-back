package com.beemonitor.beemonitorback.repository;

import com.beemonitor.beemonitorback.model.PersonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PersonRepository extends JpaRepository<PersonEntity, Integer> {

    public Optional<PersonEntity> findByEmail(String pEmail);

}