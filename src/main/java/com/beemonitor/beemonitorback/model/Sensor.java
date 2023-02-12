package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "sensor")
public class Sensor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "INT UNSIGNED not null")
    private Long id;

    @Column(name = "ref", nullable = false, length = 45)
    private String ref;

    @Column(name = "type", nullable = false, length = 45)
    private String type;

    @Column(name = "is_active")
    private Byte isActive;


    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_hive")
    private Hive idHive;


    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_apiary")
    private Apiary idApiary;


    @JsonManagedReference
    @OneToMany(mappedBy = "idSensor")
    private Set<AlertConfig> alertConfigs = new LinkedHashSet<>();

    @JsonManagedReference
    @OneToMany(mappedBy = "idSensor")
    private Set<Measurement> measurements = new LinkedHashSet<>();

}