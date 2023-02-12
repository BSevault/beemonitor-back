package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "alert_config")
public class AlertConfig {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "INT UNSIGNED not null")
    private Long id;

    @Column(name = "alert_type", nullable = false, length = 45)
    private String alertType;

    @Column(name = "upper_limit", precision = 5, scale = 2)
    private BigDecimal upperLimit;

    @Column(name = "lower_limit", precision = 5, scale = 2)
    private BigDecimal lowerLimit;

    @Column(name = "variation", precision = 4, scale = 2)
    private BigDecimal variation;

    @Column(name = "`interval`")
    private Integer interval;

    @Column(name = "interval_unit", length = 16)
    private String intervalUnit;


    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_sensor", nullable = false)
    private Sensor idSensor;

}