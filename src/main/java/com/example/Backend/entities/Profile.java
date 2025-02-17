package com.example.Backend.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;

@Data
@Entity
@Table(name ="profile")

public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;
    private String username;
    private String email;
    private String password;
    //private String date_of_birth;

    // Automatically set the current timestamp
    @CreationTimestamp
    @Column(updatable = false)
    private Timestamp created_at;

    // Automatically update the timestamp
    @UpdateTimestamp
    private Timestamp updated_at;

}
