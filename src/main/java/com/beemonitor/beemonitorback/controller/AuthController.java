package com.beemonitor.beemonitorback.controller;


import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.service.impl.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class AuthController {

    private final AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<PersonDtoOut> login(@RequestBody String pLogin, String pPassword) {
        var result = authService.authent(pLogin, pPassword);
        return ResponseEntity.ok(PersonDtoHandler.dtoFromEntity(result));

    }

}
