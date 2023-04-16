package com.beemonitor.beemonitorback.service.impl;

import java.util.List;

import com.beemonitor.beemonitorback.dto.handler.PersonDtoHandler;
import com.beemonitor.beemonitorback.dto.in.PersonDtoIn;
import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// @Data
@Service
public class PersonService {

    private static final Logger LOG = LogManager.getLogger();

    private final PersonRepository personRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PersonService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }

    /**
     * Gets a person by ID.
     * @param pId The ID of the person.
     * @return The PersonEntity object of the person who matches the ID, or null if ID not found.
     */
    @Transactional(readOnly = true)
    public PersonEntity findById(final Integer pId) {
        LOG.debug("--> findById");
        var result = personRepository.findById(pId)
                .filter(PersonEntity::isActive);
        LOG.debug("return: {}", result.toString());
        LOG.debug("<-- findById");
        return result.orElse(null);
    }

    /**
     * Gets all persons.
     * @return An Iterable object of persons.
     */
    @Transactional(readOnly = true)
    public List<PersonEntity> findAll() {
        LOG.debug("--> findAll");
        LOG.debug("return: {}", personRepository.findAll().toString());
        LOG.debug("<-- findAll");
        return personRepository.findAll();
    }



    /**
     * Adds a new person.
     * @param pDTO The PersonDtoIn carrying the new person's info.
     * @return The PersonEntity object of the new person.
     */
    @Transactional(rollbackFor = Exception.class)
    public PersonEntity insert(PersonDtoIn pDTO) {
        LOG.debug("--> insert");
        var entity = PersonDtoHandler.entityFromDTO(pDTO);
        entity.setPwd(passwordEncoder.encode(entity.getPwd()));
        LOG.debug("return: {}", entity.toString());
        LOG.debug("<-- insert");
        return personRepository.save(entity);
    }

    /**
    * Updates an existing PersonEntity in the system with the given ID.
    * @param pId The ID of the person to be updated.
    * @param pDTO The PersonDtoIn object containing the updated information of the person.
    * @return The updated PersonEntity object, or null if the person does not exist.
     */
    @Transactional(rollbackFor = Exception.class)
    public PersonEntity update(Integer pId, PersonDtoIn pDTO) {
        LOG.debug("--> update");
        var entity = personRepository.findById(pId)
                .filter(PersonEntity::isActive)
                .orElse(null);
        if(entity == null)
            return null;

        if(pDTO.getFirstName() != null)
            entity.setFirstName(pDTO.getFirstName());

        if(pDTO.getLastName() != null)
            entity.setLastName(pDTO.getLastName());

        if(pDTO.getEmail() != null)
            entity.setEmail(pDTO.getEmail());

        if(pDTO.getPwd() != null)
            entity.setPwd(passwordEncoder.encode(entity.getPwd()));

        if(pDTO.getPhone() != null)
            entity.setPhone(pDTO.getPhone());

        if(pDTO.getAdress() != null)
            entity.setAdress(pDTO.getAdress());

        personRepository.save(entity);
        LOG.debug("return: {}", entity);
        LOG.debug("<-- update");
        return entity;
    }

    /**
     * Deletes an existing PersonEntity in the system with the given ID.
     * @param pId The ID of the person to be deleted.
     * @return The deleted PersonEntity object, or null if the person does not exist.
     */
    @Transactional(rollbackFor = Exception.class)
    public PersonEntity delete (Integer pId) {
        LOG.debug("--> delete");
        var entity = personRepository.findById(pId).orElse(null);
        if(entity != null)
            entity.setActive(false);
        LOG.debug("return: {}", entity);
        LOG.debug("<-- delete");
        return entity;
    }

}
