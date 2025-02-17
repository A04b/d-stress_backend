package com.example.Backend.controller;

import com.example.Backend.entities.Booking;
import com.example.Backend.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/")
public class BookingController {

    private final BookingService bookingService;

    @Autowired
    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }
    @PostMapping("/booking")
    public ResponseEntity<Booking> createBooking(@RequestBody Booking bookingRequest) {
        Booking booking = bookingService.createBooking(bookingRequest);
        return ResponseEntity.ok(booking);
    }

    /*
    //Transaction
    @PostMapping("/transactions")
    public ResponseEntity<Transaction> processTransaction(@RequestBody TransactionRequest transactionRequest) {
        Transaction transaction = transactionService.processTransaction(transactionRequest);
        if (transaction.getTransactionStatus().equals("SUCCESS")) {
            bookingService.updatePaymentStatus(transaction.getBookingId(), "COMPLETED");
        }
        return ResponseEntity.ok(transaction);
    }*/

}




