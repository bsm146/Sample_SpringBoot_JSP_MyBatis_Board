package com.example.boardJsp.service;

import com.example.boardJsp.mapper.BoardMapper;
import com.example.boardJsp.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

}
