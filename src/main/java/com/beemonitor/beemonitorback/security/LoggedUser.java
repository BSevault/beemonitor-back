package com.beemonitor.beemonitorback.security;

import com.beemonitor.beemonitorback.model.PersonEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

public class LoggedUser implements UserDetails {

    private final PersonEntity loggedUser;

    public LoggedUser(PersonEntity personEntity) {
        this.loggedUser = personEntity;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();

        // if(loggedUser.isAdmin() && loggedUser.isActive()) {
        //     authorities.add(new SimpleGrantedAuthority("ADMIN"));
        // } else if(loggedUser.isActive()) {
        //     authorities.add(new SimpleGrantedAuthority("USER"));
        // }
        return authorities;
    }

    @Override
    public String getPassword() {
        return loggedUser.getPwd();
    }

    @Override
    public String getUsername() {
        return loggedUser.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return loggedUser.isActive();
    }
}
