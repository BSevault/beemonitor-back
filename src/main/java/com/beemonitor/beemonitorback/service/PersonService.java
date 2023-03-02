package com.beemonitor.beemonitorback.service;

import java.util.List;

import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


// @Data
@Service
public class PersonService {

    // @Autowired
    private final PersonRepository personRepository;


    @Autowired
    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }


    /**
     * Read - Get a person by the id
     * @param id The id of the person
     * @return The person which matches the id or null if id not found
     */
    public PersonEntity findPersonById(final Long id) {
        return personRepository.findById(id).orElse(null);
    }

    /**
     * Read - Get all persons
     * @return An Iterable object of persons
     */
    public List<PersonEntity> findPersons() {
        return personRepository.findAll();
    }



}
