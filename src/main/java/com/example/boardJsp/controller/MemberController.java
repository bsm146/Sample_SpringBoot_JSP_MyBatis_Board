package com.example.boardJsp.controller;

import com.example.boardJsp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

    @Autowired
    private BoardService boardService;

    // 회원가입 페이지 이동
    @GetMapping("/memberJoin")
    public String memberJoin(Model model) {

        model.addAttribute("view", "memberJoin.jsp");

        return "view";
    }
}
