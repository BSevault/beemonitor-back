package com.beemonitor.beemonitorback.model;

import java.io.Serial;
import java.time.LocalDate;
import java.util.*;

import jakarta.persistence.*;


@Entity
@Table(name = "person")
public class PersonEntity extends AbstractEntity {

    @Serial
    private static final long serialVersionUID = 1L;


    @Column(name = "first_name", length = 45, nullable = false)
    private String firstName;

    @Column(name = "last_name", length = 45, nullable = false)
    private String lastName;

    @Column(name = "email", length = 45, nullable = false)
    private String email;

    @Column(name = "pwd", length = 512, nullable = false)
    private String pwd;

    @Column(name = "phone", length = 45)
    private String phone;

    @Column(name = "adress", length = 1000)
    private String adress;

    @Column(name = "is_admin")
    private Boolean isAdmin;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "token")
    private String token;

    @Column(name = "token_exp_date")
    private LocalDate tokenExpDate;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDate getTokenExpDate() {
        return tokenExpDate;
    }

    public void setTokenExpDate(LocalDate tokenExpDate) {
        this.tokenExpDate = tokenExpDate;
    }

    /**
     * Jointure avec la classe Apiary
     */
    @OneToMany(mappedBy = "person", fetch = FetchType.LAZY)
    private Set<Apiary> apiaries;

    /**
     * Constructeur de l'objet. <br>
     *
     * Par defaut l'id du compte sera null
     */
    public PersonEntity() {super();}

    /**
     * Constructeur de l'objet. <br>
     *
     * @param pId un id
     */
    public PersonEntity(Integer pId) {
        super(pId);
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean admin) {
        isAdmin = admin;
    }

    public Boolean isActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Set<Apiary> getApiaries() {
        return apiaries;
    }

    public void setApiaries(Set<Apiary> apiaries) {
        this.apiaries = apiaries;
    }

}
