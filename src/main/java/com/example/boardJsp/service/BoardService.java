package com.example.boardJsp.service;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.dto.Member;
import com.example.boardJsp.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
            i.setWritingDate(sdf.format(date) + " b");
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
}
