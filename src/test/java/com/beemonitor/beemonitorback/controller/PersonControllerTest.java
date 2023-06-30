package com.beemonitor.beemonitorback.controller;

import com.beemonitor.beemonitorback.model.PersonEntity;
import com.beemonitor.beemonitorback.repository.PersonRepository;
import com.beemonitor.beemonitorback.service.impl.PersonService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

//TODO mettre en place une DB H2 pour tests scenarios d'authentification
@Import(PersonController.class)
@WebMvcTest(PersonController.class)
@WithMockUser(username = "admin", roles = {"ADMIN", "USER"})
@ContextConfiguration(classes = {PersonService.class, PersonControllerTest.TestConfig.class})
class PersonControllerTest {

    @TestConfiguration
    static class TestConfig {
        @Bean
        public PasswordEncoder passwordEncoder() {
            return PasswordEncoderFactories.createDelegatingPasswordEncoder();
        }
    }

    private static final Logger LOG = LogManager.getLogger();

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private PersonRepository mockRepository;

    @Autowired
    @InjectMocks
    PersonService personService;

    PersonEntity expectedEntity() {
        PersonEntity entity = new PersonEntity(11);
        entity.setFirstName("Bob2");
        entity.setLastName("Marley");
        entity.setEmail("bob@gmail.com");
        entity.setActive(true);
        entity.setAdmin(false);
        return entity;
    }

    List<PersonEntity> expectedEntityList() {
        PersonEntity entity = new PersonEntity(11);
        entity.setFirstName("Victor");
        entity.setLastName("Wooten");
        entity.setEmail("wooten@gmail.com");
        entity.setActive(true);
        entity.setAdmin(false);
        List<PersonEntity> list = new ArrayList<>();
        list.add(expectedEntity());
        list.add(entity);
        return list;
    }

    @Test
    void validPerson_shouldReturn_response() throws Exception {
        // Arrange
        PersonEntity expectedEntity = expectedEntity();
        when(mockRepository.findById(11)).thenReturn(Optional.of(expectedEntity));

        // Act
        mockMvc.perform(get("/persons/{id}", 11))

                // Assert
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id" ).value(11))
                .andExpect(jsonPath("$.firstName").value("Bob2"))
                .andExpect(jsonPath("$.lastName").value("Marley"))
                .andExpect(jsonPath("$.email").value("bob@gmail.com"))
                .andReturn();
    }

    @Test
    void nullPerson_shouldReturn_notFound() throws Exception {

        // Act
        mockMvc.perform(get("/persons/{id}", 11))

                // Assert
                .andExpect(status().isNotFound())
                .andReturn();
    }

    @Test
    void inactivePerson_shouldReturn_notFound() throws Exception {
        // Arrange
        PersonEntity expectedEntity = expectedEntity();
        expectedEntity.setActive(false);
        when(mockRepository.findById(11)).thenReturn(Optional.of(expectedEntity));

        //Act
        mockMvc.perform(get("/persons/{id}", 11))

                // Assert
                .andExpect(status().isNotFound())
                .andReturn();
    }

    // @Test
    // @WithMockUser(username = "user", roles = "USER")
    // void unauthorizedUser_shouldReturn_unauthorized() throws Exception {
    //
    //     when(mockRepository.findAll()).thenReturn(expectedEntityList());
    //
    //     //Act
    //     mockMvc.perform(get("/persons/all"))
    //
    //             // Assert
    //             .andExpect(status().isForbidden());
    // }

}