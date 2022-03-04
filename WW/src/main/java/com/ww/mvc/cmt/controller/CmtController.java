package com.ww.mvc.cmt.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ww.mvc.cmt.model.service.CmtService;
import com.ww.mvc.cmt.model.vo.Cmt;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cmt")
public class CmtController {
    
    @Autowired(required = false)
    private CmtService service;
    
    @GetMapping("/dashBoard")
    public String cmt() {
        
        return "/cmt/dashBoard";
    }

    @GetMapping("/modify")
    public String cmtModify() {
        
        return "/cmt/modify";
    }
    
    @GetMapping("/monthly")
    public String cmtMonthly() {
        
        return "/cmt/monthly";
    }
    
}