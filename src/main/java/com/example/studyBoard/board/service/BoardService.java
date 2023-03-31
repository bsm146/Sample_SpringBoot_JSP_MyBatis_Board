package com.example.studyBoard.board.service;

import com.example.studyBoard.board.dto.Board;
import com.example.studyBoard.member.dto.Member;
import com.example.studyBoard.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

        List<Member> idCheckResult = boardMapper.idCheck(id);
        String idCheck = "";

        if (idCheckResult.isEmpty()) {
            idCheck = "Y";

        } else {
            idCheck = "N";
        }

        return idCheck;
    }

    // pwCheck 테스트
    public String pwCheck(Member member) {

        List<Member> pwCheckResult = boardMapper.loginCheck(member);
        String pwCheck = "";

        if (pwCheckResult.isEmpty()) {
            pwCheck = "N";

        } else {
            pwCheck = "Y";
        }

        return pwCheck;
    }
}
