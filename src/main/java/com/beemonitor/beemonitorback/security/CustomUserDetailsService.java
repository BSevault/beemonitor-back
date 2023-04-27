package com.beemonitor.beemonitorback.security;

import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;
import com.beemonitor.beemonitorback.service.impl.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service()
public class CustomUserDetailsService implements UserDetailsService {

    private final PersonRepository personRepository;

    @Autowired
    public CustomUserDetailsService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String pEmail) throws UsernameNotFoundException {
        var user = personRepository.findByEmail(pEmail);
        if(user.isEmpty())
            throw new UsernameNotFoundException(pEmail);
        return new LoggedUser(user.get());
    }
}
