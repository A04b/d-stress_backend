package com.example.Backend.controller;

import com.example.Backend.entities.Profile;
import com.example.Backend.dto.LoginRequest;
import com.example.Backend.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/user")
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    // Register endpoint
    @PostMapping("/register")
    public String registerUser(@RequestBody Profile profile) {
        return profileService.registerUser(profile);
    }

    private LoginRequest loginRequest;

    // Login endpoint
    @PostMapping("/login")
    public String loginUser(@RequestBody LoginRequest loginRequest) {
        return profileService.loginUser(loginRequest.getEmail(), loginRequest.getPassword());
    }
}

