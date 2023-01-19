package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "apiary")
public class Apiary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column
    private String name;

    @Column
    private float latitude;

    @Column
    private float longitude;

    @Column(name = "creation_date")
    private Date creationDate;

    @Column(name = "end_date")
    private Date endDate;

    @Column(name = "is_active")
    private String isActive;


    /**
     * "person_id" is the foreign key attribute in apiary table
     */
    @ManyToOne
    @JoinColumn(name = "person_id", nullable = false)
    @JsonBackReference
    // @JsonManagedReference
    private Person person;


    @JsonManagedReference
    @OneToMany(mappedBy = "apiary", orphanRemoval = true)
    private Collection<Hive> hives = new ArrayList<>();

}
