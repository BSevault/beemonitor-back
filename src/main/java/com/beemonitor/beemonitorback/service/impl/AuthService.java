package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;
import com.beemonitor.beemonitorback.service.IAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService implements IAuthService {

    private final PersonRepository personRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AuthService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public PersonEntity authent(String pEmail, String pPassword) {
        var entity = personRepository.findByEmail(pEmail);
        if(entity.isEmpty())
            return null;

        if(passwordEncoder.matches(pPassword, entity.get().getPwd()))
            return entity.get();

        return null;
    }
}
