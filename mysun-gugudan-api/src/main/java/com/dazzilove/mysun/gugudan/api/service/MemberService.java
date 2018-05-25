package com.dazzilove.mysun.gugudan.api.service;

import com.dazzilove.mysun.gugudan.api.domain.Member;
import com.dazzilove.mysun.gugudan.api.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberDao;

    public Member save(Member member) {
        return memberDao.save(member);
    }
    public Iterable<Member> list() { return memberDao.findAll(); }
}
