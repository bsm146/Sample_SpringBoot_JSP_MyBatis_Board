package com.example.boardJsp.mapper;

import com.example.boardJsp.dto.Board;
import com.example.boardJsp.dto.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoardMapper {

    // 게시글 불러오기
    @Select(
            "SELECT *\n" +
            "FROM   board\n" +
            "ORDER  BY id DESC\n" +
            "LIMIT  #{pageNum}, 10 "
    )
    List<Board> boardList(int pageNum);

    // 게시글 하단 버튼 관련
    @Select(
            "SELECT Ceil(Count(*) / 10)\n" +
            "FROM   board "
    )
    int boardCount();

    // 로그인
    @Select(
            "SELECT *\n" +
            "FROM   member\n" +
            "WHERE  id = #{id}\n" +
            "   AND pw = #{pw};  "
    )
    List<Member> loginCheck(int id, String pw);
}
