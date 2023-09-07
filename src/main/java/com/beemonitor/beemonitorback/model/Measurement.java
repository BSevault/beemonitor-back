package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "measurement")
public class Measurement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "INT UNSIGNED not null")
    private Long id;

    @Column(name = "value", nullable = true, precision = 7, scale = 4)
    private BigDecimal value;

    @Column(name = "measurement_date", nullable = false)
    private LocalDate measurementDate;

    @Column(name = "measurement_hour", nullable = false)
    private LocalTime measurementHour;

    @Column(name = "unit", nullable = false, length = 45)
    private String unit;


    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_sensor", nullable = false)
    private Sensor idSensor;

}