package com.example.Backend.repository;
import com.example.Backend.entities.Professional;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.List;

public interface ProfessionalRepository extends JpaRepository<Professional, Long> {
    Optional<Professional> findByEmail(String email);
    List<Professional> findAll();

}


