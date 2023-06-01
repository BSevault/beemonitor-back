package com.beemonitor.beemonitorback.dto.out;

import lombok.Getter;
import lombok.Setter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;
import java.util.Map;

// TODO virer Lombok
@Getter
@Setter
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

        //FIXME
        // this.setApiariesId((toSet)pMap.get("apiariesId"));
        if (pMap.get("apiariesId") != null)
            LOG.debug("apiariesId class : {}", pMap.get("apiariesId").getClass());

    }
}
