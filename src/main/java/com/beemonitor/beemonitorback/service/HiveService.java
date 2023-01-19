package com.beemonitor.beemonitorback.service;

import com.beemonitor.beemonitorback.model.Hive;
import com.beemonitor.beemonitorback.repository.HiveRepository;
import lombok.Data;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.inject.Inject;

@Data
@Service
public class HiveService {

    private final HiveRepository hiveRepository;

    @Inject
    public HiveService(HiveRepository hiveRepository) {
        Assert.notNull(hiveRepository, "HiveRepository must not be null");
        this.hiveRepository = hiveRepository;
    }


    /**
     * Read - Get all hives
     * @return An Iterable object of hives
     */
    public Iterable<Hive> getHives() {
        return hiveRepository.findAll();
    }

}
