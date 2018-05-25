package com.dazzilove.mysun.gugudan.api.service;

import com.dazzilove.mysun.gugudan.api.domain.Question;
import com.dazzilove.mysun.gugudan.api.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {
    @Autowired
    QuestionRepository questionRepository;

    public void addQuestion(Question question) {
        questionRepository.save(question);
    }

    public Iterable<Question> list() {
        return questionRepository.findAll();
    }
}
