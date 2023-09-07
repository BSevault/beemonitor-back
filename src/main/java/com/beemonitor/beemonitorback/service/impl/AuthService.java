package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;
import com.beemonitor.beemonitorback.service.IAuthService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
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

    //TODO gérer le code http si user inexistant ou désactivé => redirection
    public PersonEntity authent(String pEmail, String pPassword) {
        var optEntity = personRepository.findByEmail(pEmail);
        if(optEntity.isEmpty() || !optEntity.get().isActive() )
            return null;

        var entity = optEntity.get();

        if(passwordEncoder.matches(pPassword, entity.getPwd())) {
            return entity;
        }

        return null;
    }

    // public String generateToken(String part1, String part2) {
    //     var date = LocalDate.now();
    //     var string = part1 + part2 + date;
    //     Hasher hasher = Hashing.sha256().newHasher();
    //     hasher.putString(string, Charsets.UTF_8);
    //     return hasher.hash().toString();
    // }
    //
    // private void addTokenToLoggedUser(int pId, String pToken) {
    //
    //     var optEntity = personRepository.findById(pId);
    //
    //     if(optEntity.isEmpty())
    //         return;
    //
    //     var entity = optEntity.get();
    //
    //     entity.setToken(pToken);
    //     entity.setTokenExpDate(LocalDate.now());
    //
    //     personRepository.save(entity);
    //
    // }
    //
    // public boolean verifyToken(int pId, String pCookie) {
    //
    //     var cookie = pCookie.split("\\|");
    //     var token = cookie[0];
    //     var expDate = LocalDate.parse(cookie[1]);
    //
    //     var optEntity = personRepository.findById(pId);
    //
    //     if(optEntity.isEmpty())
    //         return false;
    //
    //     var entity = optEntity.get();
    //
    //     var tokenIsValid = entity.getToken().equals(token) && !expDate.isAfter(entity.getTokenExpDate());
    //
    //     return tokenIsValid;
    // }

    @Override
    public Authentication authenticate(Authentication pAuthentication) throws AuthenticationException {
        var name = pAuthentication.getName();
        var password = pAuthentication.getCredentials() != null ? pAuthentication.getCredentials().toString() : null;
        var user = this.authent(name, password);

        if (user != null) {
            Collection<GrantedAuthority> springSecurityRoles = new ArrayList<>(2);
            springSecurityRoles.add(new SimpleGrantedAuthority("ROLE_USER"));

            if (user.isAdmin())
                springSecurityRoles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

            var userPassAuthToken = new UsernamePasswordAuthenticationToken(name, password, springSecurityRoles);
            userPassAuthToken.setDetails(PersonDtoHandler.dtoFromEntity(user));
            return userPassAuthToken;
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> pAuthentication) {
        return true;
    }
}
