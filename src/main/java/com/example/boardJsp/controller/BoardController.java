package com.example.boardJsp.controller;

import com.example.boardJsp.dto.Member;
import com.example.boardJsp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 게시글 불러오기
    @GetMapping("/board")
    public String board(Model model,
                        @RequestParam(defaultValue = "1") int pageNum) {

        boardSetting(model, pageNum);

        return "board";
    }

    // board(), login() 공통 코드
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

            boardSetting(model, 1);
            session.setAttribute("userID", login.get("Y").get(0).getId());

            return "board";
        }
    }

    // logout
    @GetMapping("/logout")
    public String logout(Model model,
                         HttpServletRequest request) {

        boardSetting(model, 1);
        HttpSession session = request.getSession();
        session.removeAttribute("userID");

        return "board";
    }

    // 게시글 작성
//    @GetMapping("/boardWrite")
//    public String boardWrite(Model model,
//                        @RequestParam(defaultValue = "1") int pageNum) {
//
//
//        return "board";
//    }
}
