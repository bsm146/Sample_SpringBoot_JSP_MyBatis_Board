package com.example.boardJsp.member.controller;

import com.example.boardJsp.directory.Directory;
import com.example.boardJsp.member.dto.Member;
import com.example.boardJsp.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

    public static final String MEMBER = Directory.MEMBER;
    public static final String BOARD = Directory.BOARD;

    @Autowired
    private MemberService memberService;

    // 회원가입 페이지 이동
    @GetMapping("/memberJoinPage")
    public String memberJoinPage(Model model) {

        model.addAttribute("view", MEMBER + "memberJoin");

        return "view";
    }

    // 회원가입 처리
    @PostMapping("/memberJoin")
    public String memberJoin(Model model,
                             Member member) {

        memberService.memberJoin(member);
        model.addAttribute("view", BOARD + "board");

        return "redirect:board";
    }
}
