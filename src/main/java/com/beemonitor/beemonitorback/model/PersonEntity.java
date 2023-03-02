package com.beemonitor.beemonitorback.model;

import java.util.*;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "person")
public class PersonEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column
    private String email;

    @Column
    private String pwd;

    @Column
    private String phone;

    @Column
    private String adress;

    @Column(name = "is_admin")
    private Boolean isAdmin;

    @Column(name = "is_active")
    private Boolean isActive;


    /**
     * person is the Apiary class logical property that reflects the relationship between Person and Apiary
     */
    @OneToMany(mappedBy = "person")
    // @JsonIgnore
    // @JsonBackReference
    // @JsonManagedReference
    private List<Apiary> apiaries = new ArrayList<>();

}
