package com.dazzilove.mysun.gugudan.api.repository;

import com.dazzilove.mysun.gugudan.api.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {
}
