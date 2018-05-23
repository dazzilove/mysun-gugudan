package com.dazzilove.mysun.gugudan.api.controller;

import com.dazzilove.mysun.gugudan.api.domain.Member;
import com.dazzilove.mysun.gugudan.api.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value="/member", method = RequestMethod.POST)
    public String addMember(@RequestParam String id,
                            @RequestParam String name,
                            @RequestParam String email,
                            @RequestParam String password) {

        Member member = new Member();
        member.setId(id);
        member.setName(name);
        member.setEmail(email);
        member.setPassword(password);

        Member newMember = memberService.save(member);

        return newMember.toString();
    }
}
