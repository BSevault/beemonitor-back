package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.dto.in.PersonDTOIn;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Rollback(value = false)
class PersonServiceTest {

    @Autowired
    private PersonService personService;



    @Test
    void insert() {

        PersonDTOIn dto = new PersonDTOIn();
        dto.setFirstName("Bob");
        dto.setLastName("Marley");
        dto.setEmail("bob@gmail.com");
        dto.setPwd("test");

        var entity = personService.insert(dto);

        Assertions.assertNotNull(entity.getId(), "Id de la nouvelle entité n'est pas null");

        Assertions.assertEquals(dto.getEmail(), entity.getEmail(), "Le mail créé est celui envoyé");

    }
}