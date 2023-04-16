package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.service.IAuthService;
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
class AuthServiceTest {

    @Autowired
    private IAuthService authService;

    @Test
    void authent() {

        var entity = authService.authent("bob@gmail.com", "test");

        Assertions.assertNotNull(entity, "L'entité est nulle");

        Assertions.assertNotNull(entity.getId(), "L' ID de l'entité est nulle");

        Assertions.assertEquals("bob@gmail.com", entity.getEmail(), "Le mail n'est pas celui envoyé");

    }
}