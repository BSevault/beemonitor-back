package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.util.*;

@Entity
@Table(name = "apiary")
public class ApiaryEntity extends AbstractEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    @Column(name = "name", length = 45)
    private String name;

    @Column(name = "latitude", length = 6, precision = 4, nullable = false)
    private float latitude;

    @Column(name = "longitude", length = 7, precision = 4, nullable = false)
    private float longitude;

    @Column(name = "creation_date",nullable = false)
    @Temporal(TemporalType.DATE)
    private Date creationDate;

    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;

    @Column(name = "is_active")
    private String isActive;

    /**
     * "person_id" is the foreign key attribute in apiary table
     */
    @ManyToOne
    @JoinColumn(name = "person_id", nullable = false)
    private PersonEntity person;

    @OneToMany(mappedBy = "apiary", fetch = FetchType.LAZY)
    private Set<Hive> hives;

    @Lob
    @Column(name = "comment")
    private String comment;

    @OneToMany(mappedBy = "idApiary", fetch = FetchType.LAZY)
    private Set<Sensor> sensors;

    public ApiaryEntity() {super();}

    public ApiaryEntity(Integer pId) {super(pId);}
}
