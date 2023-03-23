package com.example.boardJsp.dto;

import lombok.Data;

@Data
public class Board {

    private int id;
    private String writer;
    private String title;
    private String content;
}
