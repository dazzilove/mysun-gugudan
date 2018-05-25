package com.dazzilove.mysun.gugudan.api.controller;

import com.dazzilove.mysun.gugudan.api.domain.Question;
import com.dazzilove.mysun.gugudan.api.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QuestionViewController {

    @Autowired
    QuestionService questionService;

    @PostMapping("/question")
    public String addQuestion(@RequestParam int xvalue, @RequestParam int yvalue) {
        Question question = new Question();
        question.setXvalue(xvalue);
        question.setYvalue(yvalue);
        questionService.addQuestion(question);
        return "saveed!";
    }

    @GetMapping("/questions")
    public Iterable<Question> list() {
        return questionService.list();
    }

}
