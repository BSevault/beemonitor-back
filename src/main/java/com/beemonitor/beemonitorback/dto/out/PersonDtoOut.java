package com.beemonitor.beemonitorback.dto.out;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

// uncomment to ignore null values on serialization
// @JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({"id", "email", "firstName", "lastName", "adress", "phone", "apiariesId", "isActive", "isAdmin"})
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

        this.setFirstName((String)pMap.get("firstName"));

        this.setLastName((String)pMap.get("lastName"));

        if (pMap.get("email") != null)
            this.setEmail((String)pMap.get("email()"));

        this.setPhone((String)pMap.get("phone"));

        this.setAdress((String)pMap.get("adress"));

        this.setIsAdmin((Boolean) pMap.get("isAdmin"));

        this.setIsActive((Boolean)pMap.get("isActive"));

        this.setApiariesId((List<Integer>)pMap.get("apiariesId"));
    }

    public Integer getId() {return id;}

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {return firstName;}

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {return lastName;}

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {return phone;}

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdress() {return adress;}

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean admin) {
        isAdmin = admin;
    }

    public Boolean isActive() {
        return isActive;
    }

    public void setIsActive(Boolean active) {
        isActive = active;
    }

    public List<Integer> getApiariesId() {
        return apiariesId;
    }

    public void setApiariesId(List<Integer> apiariesId) {
        this.apiariesId = apiariesId;
    }
}
