package com.example.boardJsp.service;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.dto.Member;
import com.example.boardJsp.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    BoardMapper boardMapper;

    // 글 불러오기
    public List<Board> boardList(int pageNum) {

        List<Board> boardList = boardMapper.boardList(pageNum);
        Timestamp timestamp;
        Date date;
        SimpleDateFormat sdf;

        for (Board i : boardList) {

            timestamp = Timestamp.valueOf(i.getWritingDate());
            date = new Date(timestamp.getTime());
            sdf = new SimpleDateFormat("yyyy-MM-dd");
            i.setWritingDate(sdf.format(date));
        }

        return boardList;
    }

    // 게시글 하단 버튼 관련
    public int boardCount() {

        return boardMapper.boardCount();
    }

    // 로그인 id, pw 체크
    public Map<String, List<Member>> loginCheck(Member member) {

        List<Member> loginUser = boardMapper.loginCheck(member);
        Map<String, List<Member>> login = null;

        if (!loginUser.isEmpty()) {

            login = new HashMap<>();
            login.put("Y", loginUser);
        }

        return login;
    }

    // 게시글 작성
    public void boardWrite(Board board) {

        boardMapper.boardWrite(board);
    }

    // 글 조회수 + 1
    public void viewDetail(int id) {

        boardMapper.viewsPlus(id);
    }

    // 글 상세 보기
    public Board viewDetail2(int id) {

        return boardMapper.viewDetail(id);
    }

    // 글 삭제
    public void boardDelete(int id) {

        boardMapper.boardDelete(id);
    }

    // 글 수정 처리
    public void boardUpdateProcess(Board board) {

        boardMapper.boardUpdateProcess(board);
    }


    // idCheck 테스트
    public String idCheck(String id) {

        List<Member> memberList = boardMapper.idCheck(id);
        String idCheckResult = "";

        if (memberList.isEmpty()) {
//            System.out.println("ID 사용 가능");
            idCheckResult = "Y";
        } else {
//            System.out.println("ID 사용 불가능");
            idCheckResult = "N";
        }

        return idCheckResult;
    }
}
