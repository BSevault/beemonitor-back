package com.beemonitor.beemonitorback.service;

import java.util.Optional;

import com.beemonitor.beemonitorback.model.Person;
import com.beemonitor.beemonitorback.repository.PersonRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Data;



@Data
@Service
public class PersonService {

    @Autowired
    private PersonRepository personRepository;

    /**
     * Read - Get a person by the id
     * @param id The id of the person
     * @return The person which matches the id
     */
    public Optional<Person> getPersonById(final Long id) {
        return personRepository.findById(id);
    }

    /**
     * Read - Get all persons
     * @return An Iterable object of persons fulfilled
     */
    public Iterable<Person> getPersons() {
        return personRepository.findAll();
    }

}
