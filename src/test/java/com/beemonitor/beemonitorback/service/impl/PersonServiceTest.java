package com.beemonitor.beemonitorback.service.impl;

import com.beemonitor.beemonitorback.dto.in.PersonDtoIn;
import com.beemonitor.beemonitorback.model.PersonEntity;
import java.util.List;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
@Rollback(value = false)
class PersonServiceTest {

    @Autowired
    private PersonService personService;

    @Test
    @Rollback()
    void insertValidUser() {

        PersonDtoIn dto = new PersonDtoIn();
        dto.setFirstName("Bob");
        dto.setLastName("Marley");
        dto.setEmail("bob2@gmail.com");
        dto.setPwd("test");

        var entity = personService.insert(dto);

        Assertions.assertNotNull(entity.getId(), "Id de la nouvelle entité est null");

        Assertions.assertEquals(dto.getEmail(), entity.getEmail(), "Le mail créé n'est pas celui envoyé");
    }

    @Test
    @Rollback()
    void insertExistingEmail_shouldReturnNull() {

        PersonDtoIn dto = new PersonDtoIn();
        dto.setFirstName("Bob");
        dto.setLastName("Marley");
        dto.setEmail("bob@gmail.com");
        dto.setPwd("test");

        var entity = personService.insert(dto);

        Assertions.assertNull(entity, "Id de la nouvelle entité est null");
    }

    /**
     * Test of findById method, of class PersonService.
     */
    @Test
    public void testFindById() {
        System.out.println("findById");
        Integer pId = null;
        PersonService instance = null;
        PersonEntity expResult = null;
        PersonEntity result = instance.findById(pId);
        Assertions.assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        Assertions.fail("The test case is a prototype.");
    }

    /**
     * Test of findAll method, of class PersonService.
     */
    @Test
    public void testFindAll() {
        System.out.println("findAll");
        PersonService instance = null;
        List<PersonEntity> expResult = null;
        List<PersonEntity> result = instance.findAll();
        Assertions.assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        Assertions.fail("The test case is a prototype.");
    }

    /**
     * Test of insert method, of class PersonService.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        PersonDtoIn pDTO = null;
        PersonService instance = null;
        PersonEntity expResult = null;
        PersonEntity result = instance.insert(pDTO);
        Assertions.assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        Assertions.fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class PersonService.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        Integer pId = null;
        PersonDtoIn pDTO = null;
        PersonService instance = null;
        PersonEntity expResult = null;
        PersonEntity result = instance.update(pId, pDTO);
        Assertions.assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        Assertions.fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class PersonService.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        Integer pId = null;
        PersonService instance = null;
        PersonEntity expResult = null;
        PersonEntity result = instance.delete(pId);
        Assertions.assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        Assertions.fail("The test case is a prototype.");
    }

}