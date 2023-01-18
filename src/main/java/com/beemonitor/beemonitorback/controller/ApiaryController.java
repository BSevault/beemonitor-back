package com.beemonitor.beemonitorback.controller;


import com.beemonitor.beemonitorback.model.Apiary;
import com.beemonitor.beemonitorback.service.ApiaryService;
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
    public Iterable<Apiary> getApiaries() {
        return apiaryService.getApiaries();
    }

}
