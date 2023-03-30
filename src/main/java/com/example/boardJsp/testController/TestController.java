package com.example.boardJsp.testController;

import com.example.boardJsp.member.dto.Member;
import com.example.boardJsp.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class TestController {

    @Autowired
    BoardService boardService;

    @GetMapping("/a")
    public String a() {

        return "a";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam String id) {

        if (id.equals("")) {
            return "NULL";
        }
        String idCheckResult = boardService.idCheck(id);

        return idCheckResult;
    }

    @PostMapping("/pwCheck")
    @ResponseBody
    public String pwCheck(@ModelAttribute Member member) {

        if (member.getPw().equals("")) {
            return "NULL";
        }
        String pwCheckResult = boardService.pwCheck(member);

        return pwCheckResult;
    }
}