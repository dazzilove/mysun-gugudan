package com.dazzilove.mysun.gugudan.api.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public @Data class Member {
    @Id
    @GeneratedValue
    int memberNo;

    String id;

    String name;

    String email;

    String password;
}
