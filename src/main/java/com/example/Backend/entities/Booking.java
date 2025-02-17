package com.example.Backend.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

import java.sql.Date;

@Data
@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private int booking_id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @JsonBackReference
    private Profile user;

    @ManyToOne
    @JoinColumn(name = "professional_id", nullable = false)
    @JsonBackReference
    private Professional professional;

    private Date appointment_date;

    private String status;

    private String payment_status;

    @PrePersist
    protected void onCreate() {
        this.status = "pending";
        this.payment_status = "pending";
    }
}
