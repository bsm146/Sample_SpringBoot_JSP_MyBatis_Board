package com.example.boardJsp.controller;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/")
    public String getIndex() {

        return "index";
    }

    @PostMapping("/board/write")
    public String boardWriteForm() {

        return "boardwrite";
    }




    @GetMapping("/test")
    public String test(Model model) {

        List<Board> list = boardService.getName();
        model.addAttribute("list", list);

        for (Board i : list) {
            System.out.println(i.getId());
            System.out.println(i.getTitle());
            System.out.println(i.getContent());
        }
//        System.out.println(list.get(0).getId());
//        System.out.println(list.get(0).getTitle());
//        System.out.println(list.get(0).getContent());

        return "boardwrite";
    }
}
