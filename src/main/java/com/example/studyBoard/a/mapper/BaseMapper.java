package com.example.studyBoard.a.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BaseMapper {

    @Select(
            ""
    )
    void base();
}
