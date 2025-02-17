package com.example.Backend.service;

import com.example.Backend.entities.Response;
import com.example.Backend.repository.ResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResponseService {

    @Autowired
    private ResponseRepository responseRepository;

    public Response saveResponse(Response response) {
        return responseRepository.save(response);
    }
}