package com.example.Backend.controller;

import com.example.Backend.service.QuestionService;
import com.example.Backend.entities.Question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api")
public class QuestionnaireController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/questionnaire/{id}/question")
    public List<Question> getQuestionsByQuestionnaire_QuestionnaireId(@PathVariable Long id) {
        return questionService.getQuestionsByQuestionnaire_QuestionnaireId(id);
    }
}
