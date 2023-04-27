package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.dto.in.PersonDtoIn;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
@Rollback(value = false)
class PersonServiceTest {

    @Autowired
    private PersonService personService;



    @Test
    @Rollback()
    void insert() {

        PersonDtoIn dto = new PersonDtoIn();
        dto.setFirstName("Bob");
        dto.setLastName("Marley");
        dto.setEmail("bob@gmail.com");
        dto.setPwd("test");

        var entity = personService.insert(dto);

        Assertions.assertNotNull(entity.getId(), "Id de la nouvelle entité est null");

        Assertions.assertEquals(dto.getEmail(), entity.getEmail(), "Le mail créé n'est pas celui envoyé");



    }
}