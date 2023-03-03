package com.beemonitor.beemonitorback.controller;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.in.PersonDTOIn;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.service.impl.PersonService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
// Prefixes all request url
@RequestMapping("/persons")
public class PersonController {

    private static final Logger LOG = LogManager.getLogger();

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
    public ResponseEntity<PersonDtoOut> getPerson(@PathVariable("id") final Integer id) {
        PersonController.LOG.debug("--> getPerson");
        PersonEntity personEntity = personService.findById(id);
        PersonDtoOut personDtoOut = PersonDtoHandler.dtoFromEntity(personEntity);
        PersonController.LOG.debug("result: {}", personDtoOut.toString());
        PersonController.LOG.debug("<-- getPerson");
        return ResponseEntity.ok(personDtoOut);
    }

    /**
     * Read - Get all persons
     * @return An iterable object of person
     */
    @GetMapping("/all")
    public ResponseEntity<List<PersonDtoOut>> getPersons() {
        PersonController.LOG.debug("--> getPersons");
        List<PersonEntity> personEntityList = personService.findAll();
        List<PersonDtoOut> personDtoOutList = PersonDtoHandler.dtoListFromEntity(personEntityList);
        PersonController.LOG.debug("<-- getPersons, result size: {}", personDtoOutList.size());
        return ResponseEntity.ok(personDtoOutList);
    }

    @PostMapping("/add")
    public ResponseEntity<PersonEntity> addPerson(@RequestBody PersonDTOIn pBody) {
        PersonController.LOG.debug("--> addPersons");
        var dto = new PersonDTOIn();
        dto.setFirstName(pBody.getFirstName());
        dto.setLastName(pBody.getLastName());
        dto.setEmail(pBody.getEmail());
        dto.setPwd(pBody.getPwd());
        dto.setAdress(pBody.getAdress());
        dto.setPhone(pBody.getPhone());
        var result = personService.insert(dto);
        PersonController.LOG.debug("result {}", result.toString());
        PersonController.LOG.debug("<-- addPersons");
        return ResponseEntity.ok(result);
    }

}
