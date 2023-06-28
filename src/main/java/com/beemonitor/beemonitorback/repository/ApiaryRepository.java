package com.beemonitor.beemonitorback.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.beemonitor.beemonitorback.model.ApiaryEntity;

@Repository
public interface ApiaryRepository extends JpaRepository<ApiaryEntity, Long> {}