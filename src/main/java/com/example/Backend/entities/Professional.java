package com.example.Backend.entities;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "professional")
public class Professional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "professional_id")
    private Long professionalId;

    private String name;
    private String specialization;
    //private Long contact_info;
    //private String bio;

    private String imageUrl;
    private String cvUrl;

    private String email;
    private String password;

}
