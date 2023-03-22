package com.example.boardJsp.service;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

//    @Autowired
//    private BoardRepo boardRepo;

    @Autowired
    BoardMapper boardMapper;

    public List<Board> getName() {

        return boardMapper.selectName();
    }
}
