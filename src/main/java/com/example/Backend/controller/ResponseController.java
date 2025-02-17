package com.example.Backend.controller;

import com.example.Backend.entities.Response;
import com.example.Backend.service.ResponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/responses")
public class ResponseController {

    @Autowired
    private ResponseService responseService;

    @PostMapping
    public Response saveUserResponse(@RequestBody Response response) {
        return responseService.saveResponse(response);
    }
}
