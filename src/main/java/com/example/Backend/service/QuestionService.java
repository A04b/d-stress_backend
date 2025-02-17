package com.example.Backend.service;

import com.example.Backend.repository.QuestionRepository;
import com.example.Backend.entities.Question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> getQuestionsByQuestionnaire_QuestionnaireId(Long questionnaireId) {
        return questionRepository.findByQuestionnaireIdWithOptions(questionnaireId);
    }

}


