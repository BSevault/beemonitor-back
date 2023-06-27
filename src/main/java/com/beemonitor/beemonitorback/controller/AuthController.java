package com.beemonitor.beemonitorback.controller;


import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.service.impl.AuthService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

// @RestController
@RequestMapping("/api")
@RestController
public class AuthController {

    private static final Logger LOG = LogManager.getLogger();

    @GetMapping
    public ResponseEntity<String> root() {
        LOG.debug("--> root");
        LOG.debug("<-- root");
        return ResponseEntity.ok("Welcome on BeeMonitor API. Everything is working fine.");
    }

    // private final AuthService authService;
    //
    // @Autowired
    // public AuthController(AuthService authService) {
    //     this.authService = authService;
    // }
    //
    // @PostMapping("/login")
    // public ResponseEntity<PersonDtoOut> login(@RequestBody LoginRequestBody body, HttpServletRequest request, HttpServletResponse response) {
    //     var userIpAdress = request.getRemoteAddr();
    //     var result = authService.authent(body.getLogin(), body.getPassword(), userIpAdress);
    //     var token = authService.generateToken(body.getLogin(), userIpAdress);
    //     String cookieValue = token + "|" + LocalDate.now();
    //     Cookie cookie = new Cookie("token", cookieValue);
    //     cookie.setHttpOnly(true);
    //
    //     response.addCookie(cookie);
    //
    //     LOG.info("Authentication successful, user: {}, password: nothing to see here.", result.getEmail());
    //     return ResponseEntity.ok(PersonDtoHandler.dtoFromEntity(result));
    //
    // }
}
