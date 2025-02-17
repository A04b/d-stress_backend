package com.example.Backend.controller;

import com.example.Backend.service.ResourceService;
import com.example.Backend.entities.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    /*@GetMapping("/resource/{type}/title")
    public List<Resource> getResourceByType(@PathVariable String type) {
        List<Resource> result = resourceService.getAll();

        if (result.isEmpty()) {
            System.out.println("No resources found for type: " + type);
        } else {
            System.out.println("Resources Found: " );
        }
        return result;
    }*/

    @GetMapping("/resources")
    public List<Resource> getAllResources() {
        List<Resource>  result = resourceService.getAllResources();
        if (result.isEmpty()) {
            System.out.println("No resources found");
        } else {
            System.out.println("Resources Found: " );
        }
        return result;
    }

}
