package com.example.Backend.service;

import com.example.Backend.entities.Booking;
import com.example.Backend.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    public Booking createBooking(Booking booking) {
        return bookingRepository.save(booking);
    }



    List<Booking> getBookingsByUser(int userId) {
        return bookingRepository.findByUser_UserId(userId);
    }

    List<Booking> getBookingsByProfessional(int professionalId) {
        return bookingRepository.findByProfessional_ProfessionalId(professionalId);
    }

    Booking updateBookingStatus(int bookingId, String status) {
        Optional<Booking> bookingOptional = bookingRepository.findById(bookingId);
        if (bookingOptional.isPresent()) {
            Booking booking = bookingOptional.get();
            booking.setStatus(status);
            return bookingRepository.save(booking);
        } else {
            throw new RuntimeException("Booking not found");
        }
    }

    Booking updatePaymentStatus(int bookingId, String paymentStatus) {
        Optional<Booking> bookingOptional = bookingRepository.findById(bookingId);
        if (bookingOptional.isPresent()) {
            Booking booking = bookingOptional.get();
            booking.setPayment_status(paymentStatus);
            return bookingRepository.save(booking);
        } else {
            throw new RuntimeException("Booking not found");
        }
    }
}


