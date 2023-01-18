package com.beemonitor.beemonitorback.service;

import java.util.Optional;

import com.beemonitor.beemonitorback.model.Apiary;
import com.beemonitor.beemonitorback.repository.ApiaryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Data;

@Data
@Service
public class ApiaryService {

    @Autowired
    private ApiaryRepository apiaryRepository;

    /**
     * Read - Get all apiaries
     * @return An Iterable object of apiaries
     */
    public Iterable<Apiary> getApiaries() {
        return apiaryRepository.findAll();
    }

}
