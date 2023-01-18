package com.beemonitor.beemonitorback.repository;

import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.Apiary;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface ApiaryRepository extends CrudRepository<Apiary, Long> {}