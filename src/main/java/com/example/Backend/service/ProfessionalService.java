package com.example.Backend.service;

import com.example.Backend.entities.Professional;
import com.example.Backend.repository.ProfessionalRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;

@Service
public class ProfessionalService {

    @Autowired
    private ProfessionalRepository professionalRepository;

    public String registerNew(Professional professional) {
        Optional<Professional> existingByEmail = professionalRepository.findByEmail(professional.getEmail());

        if (existingByEmail.isPresent()) {
            return "Email is already registered!";
        }

        professionalRepository.save(professional);
        return "Professional registered successfully!";
    }

    public String loginProfessional(String email, String password) {
        Optional<Professional> professional = professionalRepository.findByEmail(email);

        if(professional.isPresent()){
            if(professional.get().getPassword().equals(password)){
                return "Login Successful!";
            }else{
                return "Invalid Password";
            }
        }else{
            return "Email not found!";
        }
    }

    public Professional addProfessional(Professional professional, MultipartFile image, MultipartFile cv) throws IOException {
        return professionalRepository.save(professional);
    }

//    public String saveFile(MultipartFile file, String folder) throws IOException {
//        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//        String uploadDir = "uploads/" + folder;
//        File directory = new File(uploadDir);
//        if (!directory.exists()) {
//            directory.mkdirs();
//        }
//        File targetFile = new File(uploadDir + fileName);
//        file.transferTo(targetFile);
//        return folder + fileName; // Return relative path for saving to DB
//    }
public String saveFile(MultipartFile file, String subDir) throws IOException {
    String uploadDir = "C:/uploads/" + subDir;
    File directory = new File(uploadDir);

    if (!directory.exists()) {
        directory.mkdirs(); // Create directory if not exists
    }

    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
    File targetFile = new File(uploadDir + fileName);
    file.transferTo(targetFile);

    return "/uploads/" + subDir + fileName; // Relative URL for accessing the file
}

        public Professional save(Professional professional) {
            return professionalRepository.save(professional);
        }

    public List<Professional> getAllProfessionals() {
        return professionalRepository.findAll();
    }

}


