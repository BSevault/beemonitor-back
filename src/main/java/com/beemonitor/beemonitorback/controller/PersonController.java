// -#--------------------------------------
// -# ©Copyright SEVAULT Benjamin 2023 -
// -# Email: b.sevault@gmail.com -
// -# All Rights Reserved. -
// -#--------------------------------------

package com.beemonitor.beemonitorback.controller;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.in.PersonDtoIn;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.service.impl.PersonService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
     * Maps a request body to PersonDtoIn.
     *
     * @param pBody the PersonDtoIn object to be mapped.
     * @return the mapped PersonDtoIn object.
     */
    private PersonDtoIn personDTOMapper(@RequestBody PersonDtoIn pBody) {
        var dto = new PersonDtoIn();
        dto.setFirstName(pBody.getFirstName());
        dto.setLastName(pBody.getLastName());
        dto.setEmail(pBody.getEmail());
        dto.setPwd(pBody.getPwd());
        dto.setAdress(pBody.getAdress());
        dto.setPhone(pBody.getPhone());
        return dto;
    }

    /**
     * Gets a person by ID.
     * @param pId The id of the person.
     * @return The person which matches the ID.
     */
    // To return xml :
    // @GetMapping(path = "/{id}", produces = {MediaType.APPLICATION_XML_VALUE})
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN') or #pId == authentication.details.id")
    public ResponseEntity<PersonDtoOut> getPerson(@PathVariable("id") final Integer pId) {
        PersonController.LOG.debug("--> getPerson");
        PersonEntity personEntity = personService.findById(pId);
        if (personEntity == null) {
            PersonController.LOG.debug("<-- getPerson return null");
            return ResponseEntity.notFound().build();
        }
        PersonDtoOut personDtoOut = PersonDtoHandler.dtoFromEntity(personEntity);

        PersonController.LOG.debug("result: {}", personDtoOut.toString());
        PersonController.LOG.debug("<-- getPerson");
        return ResponseEntity.ok(personDtoOut);
    }

    /**
     * Gets all persons.
     * @return An iterable object of person.
     */
    @GetMapping("/all")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<List<PersonDtoOut>> getPersons() {
        PersonController.LOG.debug("--> getPersons");
        List<PersonEntity> personEntityList = personService.findAll();
        List<PersonDtoOut> personDtoOutList = PersonDtoHandler.dtoListFromEntity(personEntityList);
        PersonController.LOG.debug("<-- getPersons, result size: {}", personDtoOutList.size());
        return ResponseEntity.ok(personDtoOutList);
    }


    /**
     * Adds a new person.
     * @param pBody The request body containing the information of the person to be added.
     * @return A ResponseEntity containing the PersonDtoOut of the added person, if email already exists returns 422 status code "Unprocessable entity"
     */
    @PostMapping("/add")
    public ResponseEntity<PersonDtoOut> addPerson(@RequestBody PersonDtoIn pBody) {
        PersonController.LOG.debug("--> addPersons");
        var dto = personDTOMapper(pBody);
        var result = personService.insert(dto);

        if (result == null) {
            LOG.debug("Bad request: Provided email already exists.");
            return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).build();
        }

        PersonController.LOG.debug("result {}", result.toString());
        PersonController.LOG.debug("<-- addPersons");
        return ResponseEntity.ok(PersonDtoHandler.dtoFromEntity(result));
    }


    /**
     * Modifies the information of an existing person with the given ID.
     * @param pId HThe ID of the person to be updated.
     * @param pBody The request body containing the updated information of the person.
     * @return A ResponseEntity containing the updated PersonDtoOut of the person, or ResponseEntity.notFound() if the person does not exist.
     */
    @PatchMapping("/{id}/update")
    @PreAuthorize("hasRole('ROLE_ADMIN') or #pId == authentication.details.id")
    public ResponseEntity<PersonDtoOut> updatePerson(@PathVariable("id") Integer pId, @RequestBody PersonDtoIn pBody) {

        PersonController.LOG.debug("--> updatePerson");

        var dto = personDTOMapper(pBody);
        var result = personService.update(pId, dto);

        if (result == null) {
            PersonController.LOG.debug("<-- updatePerson return null");
            return ResponseEntity.notFound().build();
        }
        PersonController.LOG.debug("result {}", result.toString());
        PersonController.LOG.debug("<-- updatePerson");
        return ResponseEntity.ok(PersonDtoHandler.dtoFromEntity(result));
    }

    /**
     * Removes an existing person with the given ID.
     * @param pId The ID of the person to be deleted.
     * @return  ResponseEntity containing the deleted PersonDtoOut of the person.
     */
    @DeleteMapping("/{id}/delete")
    @PreAuthorize("hasRole('ROLE_ADMIN') or #pId == authentication.details.id")
    public ResponseEntity<PersonDtoOut> deletePerson(@PathVariable("id") Integer pId) {
        PersonController.LOG.debug("--> deletePerson");
        var result = personService.delete(pId);
        PersonController.LOG.debug("<-- deletePerson");
        return ResponseEntity.ok(PersonDtoHandler.dtoFromEntity(result));
    }

}
