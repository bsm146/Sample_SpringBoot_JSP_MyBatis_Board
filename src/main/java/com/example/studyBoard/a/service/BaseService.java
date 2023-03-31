package com.example.studyBoard.a.service;

import com.example.sns.a.mapper.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseService {

    @Autowired
    BaseMapper baseMapper;

    public void base() {

        baseMapper.base();
    }
}
