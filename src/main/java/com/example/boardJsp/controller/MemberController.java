package com.example.boardJsp.controller;

import com.example.boardJsp.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    private final String MEMBER = "member/";

    @Autowired
    private MemberService memberService;

    // 회원가입 페이지 이동
    @GetMapping("/memberJoin")
    public String memberJoin(Model model) {

        model.addAttribute("view", MEMBER + "memberJoin.jsp");

        return "view";
    }
}
