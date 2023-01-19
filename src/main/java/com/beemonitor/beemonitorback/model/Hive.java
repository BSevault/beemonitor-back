package com.beemonitor.beemonitorback.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hive")
public class Hive {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "INT UNSIGNED not null")
    private Long id;

    @Column(name = "name", length = 45)
    private String name;

    @Column(name = "latitude", nullable = false, precision = 8, scale = 6)
    private BigDecimal latitude;

    @Column(name = "longitude", nullable = false, precision = 9, scale = 6)
    private BigDecimal longitude;

    @Column(name = "altitude_in_m", nullable = false)
    private Integer altitudeInM;

    @Column(name = "orientation", nullable = false, length = 45)
    private String orientation;

    @Column(name = "type", nullable = false, length = 45)
    private String type;

    @Column(name = "bee_type", nullable = false, length = 45)
    private String beeType;

    @Column(name = "initial_weight_in_g", nullable = false)
    private Integer initialWeightInG;

    @Column(name = "purchase_date", nullable = false)
    private LocalDate purchaseDate;

    @Column(name = "super_count")
    private Integer superCount;

    @Lob
    @Column(name = "comment")
    private String comment;

    @Column(name = "is_active")
    private Byte isActive;


    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "apiary_id")
    private Apiary apiary;

}