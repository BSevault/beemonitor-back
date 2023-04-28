package com.beemonitor.beemonitorback.repository;

import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.ApiaryEntity;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface ApiaryRepository extends CrudRepository<ApiaryEntity, Long> {}