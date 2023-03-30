package com.example.boardJsp.board.mapper;

import com.example.boardJsp.board.dto.Board;
import com.example.boardJsp.member.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    // 글 불러오기
    @Select(
            "SELECT *\n" +
            "FROM   board\n" +
            "ORDER  BY id DESC\n" +
            "LIMIT  #{pageNum}, 10"
    )
    List<Board> boardList(int pageNum);


    // 게시글 하단 버튼 관련
    @Select(
            "SELECT Ceil(Count(*) / 10)\n" +
            "FROM   board"
    )
    int boardCount();


    // 로그인 id, pw 체크
    @Select(
            "SELECT *\n" +
            "FROM   member\n" +
            "WHERE  id = #{id}\n" +
            "   AND pw = #{pw}"
    )
    List<Member> loginCheck(Member member);


    // 게시글 작성
    @Insert(
            "INSERT INTO board\n" +
            "            (writer,\n" +
            "             title,\n" +
            "             content)\n" +
            "VALUES     (#{writer},\n" +
            "            #{title},\n" +
            "            #{content})"
    )
    void boardWrite(Board board);


    // 글 상세 보기
    @Select(
            "SELECT *\n" +
            "FROM   board\n" +
            "WHERE  id = #{id}"
    )
    Board viewDetail(int id);

    // 글 조회수 + 1
    @Update(
            "UPDATE board\n" +
            "SET    views = views + 1\n" +
            "WHERE  id = #{id}"
    )
    void viewsPlus(int id);

    // 글 삭제
    @Delete(
            "DELETE FROM board\n" +
            "WHERE  id = #{id}"
    )
    void boardDelete(int id);

    // 글 수정 처리
    @Update(
            "UPDATE board\n" +
            "SET    title = #{title},\n" +
            "       content = #{content}\n" +
            "WHERE  id = #{id}"
    )
    void boardUpdateProcess(Board board);


    // idCheck 테스트
    @Select(
            "SELECT *\n" +
            "FROM   member\n" +
            "WHERE  id = #{id}"
    )
    List<Member> idCheck(String id);
}
