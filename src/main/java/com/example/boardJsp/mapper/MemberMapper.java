package com.example.boardJsp.mapper;

import com.example.boardJsp.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    // 회원가입 처리
    @Insert(
            "INSERT INTO member\n" +
            "            (id,\n" +
            "             NAME,\n" +
            "             pw)\n" +
            "VALUES     (#{id},\n" +
            "            #{name},\n" +
            "            #{pw}); "
    )
    void memberJoin(Member member);
}
