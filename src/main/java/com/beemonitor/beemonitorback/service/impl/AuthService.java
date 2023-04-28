package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;
import com.beemonitor.beemonitorback.service.IAuthService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.common.base.Charsets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hasher;
import com.google.common.hash.Hashing;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

@Service
public class AuthService implements IAuthService {

    private final PersonRepository personRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AuthService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }

    //TODO gérer le code http si user inexistant ou désactivé
    public PersonEntity authent(String pEmail, String pPassword, String pUserIpAdress) {
        var optEntity = personRepository.findByEmail(pEmail);
        if(optEntity.isEmpty() || !optEntity.get().isActive() )
            return null;

        var entity = optEntity.get();

        if(passwordEncoder.matches(pPassword, entity.getPwd())) {
            var token = generateToken(pEmail, pUserIpAdress);
            addTokenToLoggedUser(entity.getId(), token);
            return entity;
        }

        return null;
    }

    public String generateToken(String part1, String part2) {
        var date = LocalDate.now();
        var string = part1 + part2 + date;
        Hasher hasher = Hashing.sha256().newHasher();
        hasher.putString(string, Charsets.UTF_8);
        return hasher.hash().toString();
    }

    private void addTokenToLoggedUser(int pId, String pToken) {

        var optEntity = personRepository.findById(pId);

        if(optEntity.isEmpty())
            return;

        var entity = optEntity.get();

        entity.setToken(pToken);
        entity.setTokenExpDate(LocalDate.now());

        personRepository.save(entity);

    }

    public boolean verifyToken(int pId, String pCookie) {

        var cookie = pCookie.split("\\|");
        var token = cookie[0];
        var expDate = LocalDate.parse(cookie[1]);

        var optEntity = personRepository.findById(pId);

        if(optEntity.isEmpty())
            return false;

        var entity = optEntity.get();

        var tokenIsValid = entity.getToken().equals(token) && !expDate.isAfter(entity.getTokenExpDate());

        return tokenIsValid;
    }

}
