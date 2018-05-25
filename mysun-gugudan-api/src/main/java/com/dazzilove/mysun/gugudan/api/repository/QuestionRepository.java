package com.dazzilove.mysun.gugudan.api.repository;

import com.dazzilove.mysun.gugudan.api.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Integer> {
}
