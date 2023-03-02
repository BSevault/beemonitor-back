package com.beemonitor.beemonitorback.controller;


import com.beemonitor.beemonitorback.model.Hive;
import com.beemonitor.beemonitorback.service.HiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HiveController {

    @Autowired
    private HiveService hiveService;

    /**
     * Read - Get all hives
     * @return An iterable object of hives
     */
    @GetMapping("/hives")
    public Iterable<Hive> getHives() {
        return hiveService.getHives();
    }

}
