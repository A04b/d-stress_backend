package com.example.Backend.repository;

import com.example.Backend.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {
   // @Query("SELECT b from Booking WHERE b.user.userId= :userId")
   // List<Booking> findByProfile_UserId(@Param("userId") int userId);
   List<Booking> findByUser_UserId(int userId);
   // @Query("SELECT b from Booking WHERE b.professional.professionalId= :professionalId")
   // List<Booking> findByProfessionalId(@Param("professionalId") int professionalId);
   List<Booking> findByProfessional_ProfessionalId(int professionalId);
}