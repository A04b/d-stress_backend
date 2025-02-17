package com.example.Backend.repository;
import com.example.Backend.entities.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.stereotype.Repository;

import java.util.List;



/*@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByQuestionnaire_QuestionnaireId(Long questionnaireId);
}
*/

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {

    @Query("SELECT q FROM Question q LEFT JOIN FETCH q.options WHERE q.questionnaire.questionnaireId = :questionnaireId")
    List<Question> findByQuestionnaireIdWithOptions(@Param("questionnaireId") Long questionnaireId);
}
