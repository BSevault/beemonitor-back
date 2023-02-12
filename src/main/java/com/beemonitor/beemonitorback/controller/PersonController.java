package com.beemonitor.beemonitorback.controller;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.model.Person;
import com.beemonitor.beemonitorback.service.PersonService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@Log4j2
@RestController

// Prefixes all request url
@RequestMapping("/persons")
public class PersonController {


    private final PersonService personService;


    @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }


    /**
     * Read - Get a person by the id
     * @param id The id of the person
     * @return The person which matches the id
     */

    // To return xml :
    // @GetMapping(path = "/{id}", produces = {MediaType.APPLICATION_XML_VALUE})
    @GetMapping("/{id}")
    public ResponseEntity<PersonDtoOut> getPerson(@PathVariable("id") final Long id) {
        Person person = personService.findPersonById(id);
        PersonDtoOut personDtoOut = PersonDtoHandler.dtoFromEntity(person);
        return ResponseEntity.ok(personDtoOut);
    }

    /**
     * Read - Get all persons
     * @return An iterable object of person
     */
    @GetMapping("/all")
    public ResponseEntity<List<PersonDtoOut>> getPersons() {
        log.info("-->getPersons");
        List<Person> personList = personService.findPersons();
        List<PersonDtoOut> personDtoOutList = PersonDtoHandler.dtoListFromEntity(personList);
        log.info("<--getPersons, size: {}", personDtoOutList.size());
        return ResponseEntity.ok(personDtoOutList);
    }

}
