package com.example.Backend.controller;

import com.example.Backend.entities.Professional;
import com.example.Backend.dto.LoginRequest;
import com.example.Backend.service.ProfessionalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;

//@CrossOrigin(origins = "http://localhost:5173")
//@RestController
//@RequestMapping("/api/professional")
//public class ProfessionalController{
//    @Autowired
//    private ProfessionalService professionalService;
//
//    @PostMapping("/register")
//    public String registerProfessional(@RequestBody Professional professional){
//        return professionalService.registerNew(professional);
//    }
//
//    private LoginRequest loginRequest;
//
//    @PostMapping("/login")
//    public String loginProfessionnal(@RequestBody LoginRequest loginRequest){
//        return professionalService.loginProfessional(loginRequest.getEmail(),loginRequest.getPassword());
//    }
//
//    /*@GetMapping("/professionals")
//    public List<Professional> getAllProfessionals() {
//        return professionalService.getAllProfessionals();
//    }*/
//
//    @GetMapping("/professionals")
//    public ResponseEntity<List<Professional>> getAllProfessionals() {
//        List<Professional> professionals = professionalService.getAllProfessionals();
//        return ResponseEntity.ok(professionals);
//    }
//
//    //endpoint for image and cv
//    @PostMapping("/upload-professional-file")
//    public ResponseEntity<Map<String, String>> uploadProfessionalFile(
//            @RequestParam("file") MultipartFile file) {
//        try {
//            String uploadDir = "/path/to/uploads/";
//            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//            File targetFile = new File(uploadDir + fileName);
//            file.transferTo(targetFile);
//
//            String fileUrl = "/uploads/" + fileName;
//            return ResponseEntity.ok(Map.of("fileUrl", fileUrl));
//        } catch (IOException e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    public ResponseEntity<Professional> addProfessional(
//            @RequestParam("name") String name,
//            @RequestParam("specialization") String specialization,
//            @RequestParam("bio") String bio,
//            @RequestParam(value = "image", required = false) MultipartFile image,
//            @RequestParam(value = "cv", required = false) MultipartFile cv
//    ) throws IOException {
//        Professional professional = new Professional();
//        professional.setName(name);
//        professional.setSpecialization(specialization);
//        professional.setBio(bio);
//
//        Professional savedProfessional = professionalService.addProfessional(professional, image, cv);
//        return ResponseEntity.ok(savedProfessional);
//    }
//}
//


@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/professional")
public class ProfessionalController {

    @Autowired
    private ProfessionalService professionalService;

    // Register a professional (with file upload)
    @PostMapping("/register")
    public ResponseEntity<Professional> registerProfessional(
            @RequestParam("name") String name,
            @RequestParam("specialization") String specialization,
            //@RequestParam("bio") String bio,
            @RequestParam("image") MultipartFile image,
            @RequestParam(value = "cv", required = false) MultipartFile cv
    ) {
        try {

            //professional.setBio(bio);

           // if(image != null){
                String uploadDir = "/OneDrive/Project/D-Stress/uploads/images/";
                String imageFileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
                File imageFile = new File(uploadDir + imageFileName);
                image.transferTo(imageFile);
                String imageUrl = "/uploads/images" + imageFileName;
            //}
            Professional professional = new Professional();
            professional.setName(name);
            professional.setSpecialization(specialization);
            professional.setImageUrl(imageUrl);
           // if(cv != null){
           //     String cvUrl = professionalService.saveFile(cv, "cvs/");
           //     professional.setCvUrl(cvUrl);
           // }

           // Professional savedProfessional = professionalService.addProfessional(professional, image, cv);
            Professional savedProfessional = professionalService.save(professional);
            return ResponseEntity.ok(savedProfessional);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    // Professional login
    @PostMapping("/login")
    public ResponseEntity<String> loginProfessional(@RequestBody LoginRequest loginRequest) {
        String result = professionalService.loginProfessional(loginRequest.getEmail(), loginRequest.getPassword());
        return ResponseEntity.ok(result);
    }

    // Get all professionals
    @GetMapping("/professionals")
    public ResponseEntity<List<Professional>> getAllProfessionals() {
        List<Professional> professionals = professionalService.getAllProfessionals();
        professionals.forEach(pro -> System.out.println("Professional: " + pro));
        return ResponseEntity.ok(professionals);
    }

    // Upload file endpoint (if needed separately)
    @PostMapping("/upload-file")
//    public ResponseEntity<Map<String, String>> uploadFile(@RequestParam("file") MultipartFile file) {
//        try {
//            String fileUrl = professionalService.saveFile(file, "uploads/");
//            return ResponseEntity.ok(Map.of("fileUrl", fileUrl));
//        } catch (IOException e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
   // @PostMapping("/upload-professional-file")
    public ResponseEntity<Map<String, String>> uploadProfessionalFile(
            @RequestParam("file") MultipartFile file
    ) {
        try {
            // Update this path to an accessible directory on your system
            String uploadDir = "C:/uploads/images/"; // Example directory
            File directory = new File(uploadDir);

            if (!directory.exists()) {
                directory.mkdirs(); // Create directory if it doesn't exist
            }

            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File targetFile = new File(uploadDir + fileName);
            file.transferTo(targetFile);

            String fileUrl = "/uploads/images/" + fileName; // Adjust based on your frontend access
            return ResponseEntity.ok(Map.of("fileUrl", fileUrl));
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
