package com.ww.mvc.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ww.mvc.cmt.controller.CmtController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	// 게시판 전체보기
	@GetMapping("/list")
	public String list() {
		
		return "/board/list";
	}
	
	
	// 게시글 상세조회
	@GetMapping("/view")
	public String view() {
		
		return "/board/view";
	}
	
	
	// 게시글 작성
	@GetMapping("/write")
	public String write() {
		
		return "/board/write";
	}
	
	
	
	
}
