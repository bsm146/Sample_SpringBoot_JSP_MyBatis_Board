package com.example.boardJsp.board.controller;

import com.example.boardJsp.directory.Directory;
import com.example.boardJsp.board.dto.Board;
import com.example.boardJsp.member.dto.Member;
import com.example.boardJsp.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BoardController {

    public static final String BOARD = Directory.BOARD;
    public static final String LOGIN = Directory.LOGIN;

    @Autowired
    private BoardService boardService;

    // 글 불러오기
    @GetMapping("/board")
    public String board(Model model,
                        @RequestParam(defaultValue = "1") int pageNum) {

        pageNum = (pageNum - 1) * 10;
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("boardList", boardService.boardList(pageNum));
        model.addAttribute("boardCount", boardService.boardCount());
        model.addAttribute("view", BOARD + "board");
        model.addAttribute("view", BOARD + "board");

        return "view";
    }

    // 로그인 페이지 이동
    @GetMapping("/loginPage")
    public String loginPage(Model model) {

        model.addAttribute("view", LOGIN + "login");

        return "view";
    }

    // 로그인 id, pw 체크
    @PostMapping("/login")
    public String login(@ModelAttribute Member member,
                        HttpServletRequest request) {

        HttpSession session = request.getSession();
        session.setAttribute("userID", member.getId());

        return "redirect:board";
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(Model model,
                         HttpServletRequest request) {

        HttpSession session = request.getSession();
        session.removeAttribute("userID");
        model.addAttribute("view", BOARD + "board");

        return "redirect:board";
    }

    // 글쓰기 페이지 이동
    @GetMapping("/boardWrite")
    public String boardWrite(Model model) {

        model.addAttribute("view", BOARD + "boardWrite");

        return "view";
    }

    // 글쓰기 처리
    @PostMapping("/boardWriteProcess")
    public String boardWrite(@ModelAttribute Board board) {

        boardService.boardWrite(board);

        return "redirect:board";
    }

    // 글 상세 보기
    @GetMapping("/viewDetailBefore")
    public String viewDetailBefore(@RequestParam int id,
                                   RedirectAttributes redirectAttributes) {

        boardService.viewDetail(id);
        redirectAttributes.addAttribute("id", id);

        return "redirect:viewDetail";
    }

    // 글 상세 보기2
    @GetMapping("/viewDetail")
    public String viewDetail(Model model,
                             @RequestParam int id) {

        Board board = boardService.viewDetail2(id);
        model.addAttribute("board", board);
        model.addAttribute("view", BOARD + "boardDetail");

        return "view";
    }

    // 글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam int id) {

        boardService.boardDelete(id);

        return "redirect:board";
    }

    // 글 수정
    @GetMapping("/boardUpdate")
    public String boardUpdate(Model model,
                              @RequestParam int id) {

        Board board = boardService.viewDetail2(id);
        model.addAttribute("board", board);
        model.addAttribute("view", BOARD + "boardUpdate");

        return "view";
    }

    // 글 수정 처리
    @PostMapping("/boardUpdateProcess")
    public String boardUpdateProcess(@ModelAttribute Board board,
                                     RedirectAttributes redirectAttributes) {

        boardService.boardUpdateProcess(board);
        redirectAttributes.addAttribute("id", board.getId());

        return "redirect:viewDetail";
    }
}
