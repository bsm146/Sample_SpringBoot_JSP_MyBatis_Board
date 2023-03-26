package com.example.boardJsp.controller;

import com.example.boardJsp.dto.Member;
import com.example.boardJsp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    BoardService boardService;

    @GetMapping("/a")
    public String a(Model model) {

        return "a";
    }

    @GetMapping("/b")
    @ResponseBody
    public String b(Model model,
                    HttpServletRequest request) {


        System.out.println("컨트롤러 b()");
        String name = request.getParameter("name");
        String pw = request.getParameter("age");

        List<Member> memberList = new ArrayList<>();
        Member member = new Member();
        member.setName(name);
        member.setPw(pw);
        memberList.add(member);

        return member.getName();
    }

    @GetMapping("/idCheck")
    public String idCheck(Model model,
                          HttpServletRequest request) {

        System.out.println("idCheck()");
//        System.out.println("id = " + id);
        System.out.println(request.getParameter("name"));
//        boardService.idCheck(id);
        return "a";
    }
}
