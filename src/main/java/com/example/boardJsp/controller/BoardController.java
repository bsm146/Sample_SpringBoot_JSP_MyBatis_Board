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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    private final String BOARD = "board/";
    private final String LOGIN = "login/";

    @Autowired
    private BoardService boardService;

    // 글 불러오기
    @GetMapping("/board")
    public String board(Model model,
                        @RequestParam(defaultValue = "1") int pageNum) {

        pageNum = (pageNum - 1) * 10;
        boardSetting(model, pageNum);
        model.addAttribute("view", BOARD + "board.jsp");

        return "view";
    }

    // board(), login(), logout(), boardWrite() 공통 코드
    public void boardSetting(Model model,
                             int pageNum) {

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("boardList", boardService.boardList(pageNum));
        model.addAttribute("boardCount", boardService.boardCount());
    }

    // 로그인 페이지 이동
    @GetMapping("/login")
    public String login(Model model) {

        model.addAttribute("view", LOGIN + "login.jsp");

        return "view";
    }

    // 로그인 id, pw 체크
    @PostMapping("/loginCheck")
    public String login(Model model,
                        HttpServletRequest request,
                        @ModelAttribute Member member) {

        Map<String, List<Member>> login = boardService.loginCheck(member);
        HttpSession session = request.getSession();

        if (login == null) {

            model.addAttribute("view", LOGIN + "login.jsp");
            return "view";

        } else {

            session.setAttribute("userID", login.get("Y").get(0).getId());
            boardSetting(model, 0);
            model.addAttribute("view", BOARD + "board.jsp");
            return "view";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(Model model,
                         HttpServletRequest request) {

        HttpSession session = request.getSession();
        session.removeAttribute("userID");
        boardSetting(model, 0);
        model.addAttribute("view", BOARD + "board.jsp");

        return "view";
    }

    // 글쓰기 페이지 이동
    @GetMapping("/boardWrite")
    public String boardWrite(Model model) {

        model.addAttribute("view", BOARD + "boardWrite.jsp");
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

//        System.out.println("viewDetail()");
        Board board = boardService.viewDetail2(id);
        model.addAttribute("board", board);
        model.addAttribute("view", BOARD + "boardDetail.jsp");

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

//        System.out.println("boardUpdate()");
        Board board = boardService.viewDetail2(id);
        model.addAttribute("board", board);
        model.addAttribute("view", BOARD + "boardUpdate.jsp");


        return "view";
    }

    // 글 수정 처리
    @PostMapping("/boardUpdateProcess")
    public String boardUpdateProcess(@ModelAttribute Board board,
                                     RedirectAttributes redirectAttributes) {

//        System.out.println("boardUpdateProcess()");
        boardService.boardUpdateProcess(board);
        redirectAttributes.addAttribute("id", board.getId());

        return "redirect:viewDetail";
    }
}
