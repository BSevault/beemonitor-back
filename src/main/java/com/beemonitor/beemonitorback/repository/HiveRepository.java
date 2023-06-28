package com.beemonitor.beemonitorback.repository;

import com.beemonitor.beemonitorback.model.Hive;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HiveRepository extends JpaRepository<Hive, Long> {}