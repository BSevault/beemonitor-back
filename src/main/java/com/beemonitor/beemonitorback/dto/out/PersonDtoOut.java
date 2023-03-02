package com.beemonitor.beemonitorback.dto.out;

import jakarta.persistence.Column;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PersonDtoOut {

    private Long id;

    private String firstName;

    private String lastName;

    private String email;


    // PASSWORD : DO NOT TRANSFER
    // private String pwd;

    private String phone;

    private String adress;

    private Boolean isAdmin;

    private Boolean isActive;

    private List<Long> apiariesId;

}
