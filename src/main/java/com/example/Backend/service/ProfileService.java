package com.example.Backend.service;

import com.example.Backend.entities.Profile;
import com.example.Backend.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProfileService {

    @Autowired
    private ProfileRepository profileRepository;

    public String registerUser(Profile profile) {
        // Check if the username or email already exists
        Optional<Profile> existingUserByEmail = profileRepository.findByEmail(profile.getEmail());
        Optional<Profile> existingUserByUsername = profileRepository.findByUsername(profile.getUsername());

        if (existingUserByEmail.isPresent()) {
            return "Email is already registered!";
        }

        if (existingUserByUsername.isPresent()) {
            return "Username is already registered!";
        }

        profileRepository.save(profile);
        return "User registered successfully!";
    }


    public String loginUser(String email, String password) {
        Optional<Profile> profile = profileRepository.findByEmail(email);

        if (profile.isPresent()) {
            // Check if the password matches
            if (profile.get().getPassword().equals(password)) {
                return "Login successful!";
            } else {
                return "Invalid password!";
            }
        } else {
            return "Email not found!";
        }
    }
}
