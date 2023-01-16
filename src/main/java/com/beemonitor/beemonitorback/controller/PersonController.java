package com.beemonitor.beemonitorback.controller;

import com.beemonitor.beemonitorback.model.Person;
import com.beemonitor.beemonitorback.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class PersonController {

    @Autowired
    private PersonService personService;


    /**
     * Read - Get a person by the id
     * @param id The id of the person
     * @return The person which matches the id
     */
    @GetMapping("/person/{id}")
    public Person getPerson(@PathVariable("id") final Long id) {
        Optional<Person> person = personService.getPersonById(id);
        return person.orElse(null);
    }

    /**
     * Read - Get all persons
     * @return An iterable object of person
     */
    @GetMapping("/persons")
    public Iterable<Person> getPersons() {
        return personService.getPersons();
    }

}
