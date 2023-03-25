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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 글 불러오기
    @GetMapping("/board")
    public String board(Model model,
                        @RequestParam(defaultValue = "1") int pageNum) {

//        System.out.println("board()");
        pageNum = (pageNum - 1) * 10;
        boardSetting(model, pageNum);

        return "board";
    }

    // board(), login(), logout(), boardWrite() 공통 코드
    public void boardSetting(Model model,
                             int pageNum) {

//        System.out.println("boardSetting()");
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("boardList", boardService.boardList(pageNum));
        model.addAttribute("boardCount", boardService.boardCount());
    }

    // 로그인 페이지 이동
    @GetMapping("/login")
    public String login() {

        return "login";
    }

    // 로그인 id, pw 체크
    @PostMapping("/loginCheck")
    public String login(Model model,
                        HttpServletRequest request,
                        @ModelAttribute Member member) {

        Map<String, List<Member>> login = boardService.loginCheck(member);
        HttpSession session = request.getSession();

        if (login == null) {

            return "login";

        } else {

            session.setAttribute("userID", login.get("Y").get(0).getId());
            boardSetting(model, 0);

            return "board";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(Model model,
                         HttpServletRequest request) {

        HttpSession session = request.getSession();
        session.removeAttribute("userID");
        boardSetting(model, 0);

        return "board";
    }

    // 글쓰기 페이지 이동
    @GetMapping("/boardWrite")
    public String boardWrite() {

        return "boardWrite";
    }

    // 글쓰기 처리
    @PostMapping("/boardWriteProcess")
    public String boardWrite(Model model,
                             HttpServletRequest request,
                             @ModelAttribute Board board) {

//        System.out.println("boardWrite()");
        boardService.boardWrite(board);

        return "redirect:board";
    }

    // 글 상세 보기
    @GetMapping("/viewDetailBefore")
    public String viewDetailBefore(@RequestParam int id,
                                   RedirectAttributes redirectAttributes) {

        System.out.println("viewDetailBefore()");

        boardService.viewDetail(id);
        redirectAttributes.addAttribute("id", id);

        return "redirect:viewDetail";
    }

    @GetMapping("/viewDetail")
    public String viewDetail(Model model,
                             @RequestParam int id) {

        System.out.println("viewDetail() ");
        Board board = boardService.viewDetail2(id);
        model.addAttribute("board", board);

        return "viewDetail";
    }
}
