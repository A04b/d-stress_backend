package com.example.Backend.entities; // Replace with your actual package name

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "resource")
public class Resource {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long resource_id;

    private String title;
    private String description;
    private String type;

}
