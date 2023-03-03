package com.beemonitor.beemonitorback.service.impl;

import java.util.Optional;

import com.beemonitor.beemonitorback.model.Apiary;
import com.beemonitor.beemonitorback.repository.ApiaryRepository;

import org.hibernate.service.spi.InjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Data;
import org.springframework.util.Assert;



// @Data
@Service
public class ApiaryService {

    // @Autowired
    private final ApiaryRepository apiaryRepository;

    @Autowired
    public ApiaryService(ApiaryRepository apiaryRepository) {
        this.apiaryRepository = apiaryRepository;
    }


    /**
     * Read - Get all apiaries
     * @return An Iterable object of apiaries
     */
    public Iterable<Apiary> getApiaries() {
        return apiaryRepository.findAll();
    }

}
