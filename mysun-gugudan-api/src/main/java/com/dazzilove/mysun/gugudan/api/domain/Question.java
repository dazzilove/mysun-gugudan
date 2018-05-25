package com.dazzilove.mysun.gugudan.api.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public @Data class Question {
    @Id
    @GeneratedValue
    int questionNo;

    int xvalue;

    int yvalue;
}
