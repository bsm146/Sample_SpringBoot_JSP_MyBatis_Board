package com.example.studyBoard.a.controller;

import com.example.sns.a.service.BaseService;
import com.example.sns.directory.Directory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

    public static final String HOME = Directory.HOME;

    @Autowired
    private BaseService baseService;

    @GetMapping("/a")
    public String base() {

        baseService.base();

        return "a";
    }
}
