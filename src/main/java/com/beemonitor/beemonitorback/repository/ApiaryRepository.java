package com.beemonitor.beemonitorback.repository;

import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.Apiary;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

@Repository
public interface ApiaryRepository extends CrudRepository<Apiary, Long> {}