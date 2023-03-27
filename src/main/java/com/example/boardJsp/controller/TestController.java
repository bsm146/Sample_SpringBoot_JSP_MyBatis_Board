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
}
