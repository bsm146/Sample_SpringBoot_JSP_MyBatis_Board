package com.example.boardJsp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    // 회원가입 처리
    @Insert(
            ""
    )
    void memberJoin();
}
