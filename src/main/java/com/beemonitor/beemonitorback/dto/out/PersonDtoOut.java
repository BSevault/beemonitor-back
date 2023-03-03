package com.beemonitor.beemonitorback.dto.out;

import jakarta.persistence.Column;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

// TODO virer Lombok
@Getter
@Setter
public class PersonDtoOut {

    private Integer id;

    private String firstName;

    private String lastName;

    private String email;


    // PASSWORD : DO NOT TRANSFER
    // private String pwd;

    private String phone;

    private String adress;

    private Boolean isAdmin;

    private Boolean isActive;

    private List<Integer> apiariesId;

    @Override
    public String toString() {
        return "PersonDtoOut{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", adress='" + adress + '\'' +
                ", isAdmin=" + isAdmin +
                ", isActive=" + isActive +
                ", apiariesId=" + apiariesId +
                '}';
    }
}
