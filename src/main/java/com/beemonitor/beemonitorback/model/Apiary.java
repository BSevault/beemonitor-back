package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.*;

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
    private PersonEntity personEntity;


    @JsonManagedReference
    @OneToMany(mappedBy = "apiary", orphanRemoval = true)
    private Set<Hive> hives = new LinkedHashSet<>();

    @Lob
    @Column(name = "comment")
    private String comment;


    @JsonManagedReference
    @OneToMany(mappedBy = "idApiary")
    private Set<Sensor> sensors = new LinkedHashSet<>();

}
