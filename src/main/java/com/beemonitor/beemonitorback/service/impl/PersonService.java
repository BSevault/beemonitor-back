package com.beemonitor.beemonitorback.service.impl;

import java.util.List;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.in.PersonDTOIn;
import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// @Data
@Service
public class PersonService {

    // @Autowired
    private final PersonRepository personRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PersonService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }


    /**
     * Read - Get a person by the id
     * @param id The id of the person
     * @return The person which matches the id or null if id not found
     */
    @Transactional(readOnly = true)
    public PersonEntity findById(final Integer id) {
        return personRepository.findById(id)
                .orElse(null);
    }

    /**
     * Read - Get all persons
     * @return An Iterable object of persons
     */
    @Transactional(readOnly = true)
    public List<PersonEntity> findAll() {
        return personRepository.findAll();
    }

    @Transactional(rollbackFor = Exception.class)
    public PersonEntity insert(PersonDTOIn pDTO) {
        var entity = PersonDtoHandler.entityFromDTO(pDTO);
        entity.setPwd(passwordEncoder.encode(entity.getPwd()));
        return personRepository.save(entity);
    }

}
