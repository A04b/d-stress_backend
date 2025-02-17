package com.example.Backend.entities;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "questionnaire")
public class Questionnaire {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long questionnaireId;

    private String title;
    private String description;

    @OneToMany(mappedBy = "questionnaire", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Question> questions;

}
