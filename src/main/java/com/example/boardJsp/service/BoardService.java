package com.example.boardJsp.service;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.dto.Member;
import com.example.boardJsp.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    BoardMapper boardMapper;

    // 게시글 불러오기
    public List<Board> boardList(int pageNum) {

        return boardMapper.boardList(pageNum);
    }

    // 게시글 하단 버튼 관련
    public int boardCount() {

        return boardMapper.boardCount();
    }

    // 로그인
    public Map<String, List<Member>> loginCheck(int id, String pw) {

        List<Member> loginUser = boardMapper.loginCheck(id, pw);
        Map<String, List<Member>> login = null;

        if (!loginUser.isEmpty()) {

            login = new HashMap<>();
            login.put("Y", loginUser);
        }

        return login;
    }
}
