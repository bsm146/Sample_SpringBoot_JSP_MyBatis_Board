package com.example.boardJsp.member.service;

import com.example.boardJsp.member.dto.Member;
import com.example.boardJsp.member.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    // 회원가입 처리
    public void memberJoin(Member member) {

        memberMapper.memberJoin(member);
    }
}
