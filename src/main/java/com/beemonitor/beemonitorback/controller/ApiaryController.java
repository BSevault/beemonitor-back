package com.beemonitor.beemonitorback.controller;


import com.beemonitor.beemonitorback.model.ApiaryEntity;
import com.beemonitor.beemonitorback.service.impl.ApiaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiaryController {

    @Autowired
    private ApiaryService apiaryService;

    /**
     * Read - Get all apiaries
     * @return An iterable object of apiaries
     */
    @GetMapping("/apiaries")
    public Iterable<ApiaryEntity> getApiaries() {
        return apiaryService.getApiaries();
    }

}
