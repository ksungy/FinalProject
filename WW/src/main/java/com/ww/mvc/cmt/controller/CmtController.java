package com.ww.mvc.cmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cmt")
public class CmtController {
	
	@GetMapping("/dashBoard")
	public String cmt() {
		
		return "/cmt/dashBoard";
	}

	@GetMapping("/modify")
	public String cmtModify() {
		
		return "/cmt/modify";
	}
}
