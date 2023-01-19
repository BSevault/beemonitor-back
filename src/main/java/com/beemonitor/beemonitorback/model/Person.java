package com.beemonitor.beemonitorback.model;

import java.util.Collection;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String last_name;

    @Column
    private String email;

    @Column
    private String pwd;

    @Column
    private String phone;

    @Column
    private String adress;

    @Column
    private Boolean isAdmin;

    @Column
    private Boolean isActive;


    /**
     * person is the Apiary class logical property that reflects the relationship between Person and Apiary
     */
    @OneToMany(mappedBy = "person")
    // @JsonIgnore
    // @JsonBackReference
    @JsonManagedReference
    private Collection<Apiary> apiaries;

}
