package com.ww.mvc.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ww.mvc.board.model.service.BoardService;
import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.cmt.controller.CmtController;
import com.ww.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시판 전체보기
	@GetMapping("/list")
	public ModelAndView list(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count) {
		
	    PageInfo pageInfo = null;
	    List<Board> list = null;

	    log.info("page number : {}", page);

	    pageInfo = new PageInfo(page, 10, service.getBoardCount() , count);

	    list = service.getBoardList(pageInfo);

	    model.addObject("pageInfo", pageInfo);
	    model.addObject("list", list);
	    model.setViewName("board/list");

	    return model;
		
	}
	
	
	// 게시글 상세조회
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {
		
		Board board = service.findBoardByNo(no);
		
		model.addObject("board", board);
		model.setViewName("board/view");
		
		return model;
	}
	
	
	// 게시글 작성
	@GetMapping("/write")
	public String write() {
		
		return "/board/write";
	}
	
	
	// 게시글 수정
	
	// 게시글 삭제
	
	
	
	
}
