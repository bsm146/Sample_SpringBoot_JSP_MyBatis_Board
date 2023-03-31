package com.example.studyBoard.member.service;

import com.example.studyBoard.member.dto.Member;
import com.example.studyBoard.member.mapper.MemberMapper;
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
