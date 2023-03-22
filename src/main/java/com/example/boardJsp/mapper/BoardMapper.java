package com.example.boardJsp.mapper;

import com.example.boardJsp.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Select(
//            "SELECT * FROM board WHERE id = 2"
            "SELECT * FROM board"
    )
    List<Board> selectName();
}
