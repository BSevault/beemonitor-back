package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.model.ApiaryEntity;
import com.beemonitor.beemonitorback.repository.ApiaryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
    public Iterable<ApiaryEntity> getApiaries() {
        return apiaryRepository.findAll();
    }

}
