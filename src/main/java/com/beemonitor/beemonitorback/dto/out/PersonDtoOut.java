package com.beemonitor.beemonitorback.dto.out;

import lombok.Getter;
import lombok.Setter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

// TODO virer Lombok
public class PersonDtoOut {

    private static final Logger LOG = LogManager.getLogger();

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

    public PersonDtoOut() {
    }

    public PersonDtoOut(Map<String, ?> pMap) {

        if (pMap.get("id") != null)
            this.setId((Integer) pMap.get("id"));

        this.setFirstName((String)pMap.get("fistName"));

        this.setLastName((String)pMap.get("lastName"));

        if (pMap.get("email") != null)
            this.setEmail((String)pMap.get("email()"));

        this.setPhone((String)pMap.get("phone"));

        this.setAdress((String)pMap.get("adress"));

        this.setIsAdmin((Boolean) pMap.get("isAdmin"));

        this.setIsActive((Boolean)pMap.get("isActive"));

        this.setApiariesId((List<Integer>)pMap.get("apiariesId"));
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public void setIsAdmin(Boolean admin) {
        isAdmin = admin;
    }

    public void setIsActive(Boolean active) {
        isActive = active;
    }

    public void setApiariesId(List<Integer> apiariesId) {
        this.apiariesId = apiariesId;
    }
}
