package com.example.boardJsp.controller;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.dto.Member;
import com.example.boardJsp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 게시글 불러오기
    @GetMapping("/board")
    public String board(Model model,
                        @RequestParam(defaultValue = "1") int pageNum) {

        pageNum = (pageNum - 1) * 10;
        boardSetting(model, pageNum);

        return "board";
    }

    // board(), login(), logout(), boardWrite() 공통 코드
    public void boardSetting(Model model,
                             int pageNum) {

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("boardList", boardService.boardList(pageNum));
        model.addAttribute("boardCount", boardService.boardCount());
    }

    // login 페이지 이동
    @GetMapping("/login")
    public String login() {

        return "login";
    }

    // id, pw 체크
    @PostMapping("/loginCheck")
    public String login(Model model,
                        HttpServletRequest request,
                        @ModelAttribute Member member) {

        Map<String, List<Member>> login = boardService.loginCheck(member.getId(), member.getPw());
        HttpSession session = request.getSession();

        if (login == null) {

            return "login";

        } else {

            session.setAttribute("userID", login.get("Y").get(0).getId());
            boardSetting(model, 1);

            return "board";
        }
    }

    // logout
    @GetMapping("/logout")
    public String logout(Model model,
                         HttpServletRequest request) {

        HttpSession session = request.getSession();
        session.removeAttribute("userID");
        boardSetting(model, 1);

        return "board";
    }

    // 게시글 작성 페이지 이동
    @GetMapping("/boardWrite")
    public String boardWrite() {

        return "boardWrite";
    }

    // 게시글 작성 처리
    @PostMapping("/boardWriteProcess")
    public String boardWrite(Model model,
                             HttpServletRequest request,
                             @ModelAttribute Board board) {

        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        boardService.boardWrite(userID, board);
        boardSetting(model, 1);

        return "redirect:board";
    }
}
