package com.ww.mvc.document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.document.model.service.DocumentService;
import com.ww.mvc.document.model.vo.Document;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Document_Controller {
	
	@Autowired
	private DocumentService serivce;
	
	// ▼ 문서 리스트
	@GetMapping("/document/list")
	public ModelAndView documentList(ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pages){
		
		//PageInfo(현재 페이지, 한페이지에 리스트수, 전체리스트 수, 한 페이지에 표시된 리스트수)
		int documentListCount = serivce.getDocumentCount();
		PageInfo pageInfo = new PageInfo(page, 10, documentListCount, pages);
		List<Document> documentList = serivce.getDocumentList(pageInfo);
		
		model.addObject("pageInfo",pageInfo);
		model.addObject("documentList",documentList);
		model.setViewName("document/documentList");
		
		return model;
	}

	// ▼ 문서 검색
	@GetMapping("/document/search")
	public ModelAndView boardSearch(ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count,
			@RequestParam("type") String type,
			@RequestParam("search") String search	
			) {
		
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("type", type);
		searchMap.put("search", search);
		
		int documentSearchCount = serivce.getDocumentSearchCount();
		PageInfo pageInfo = new PageInfo(page, 10, documentSearchCount, count);
		List<Document> documentSearchList = serivce.getDocumentSearchList(searchMap,pageInfo);
		
		model.addObject("searchMap", searchMap);
		model.addObject("pageInfo", pageInfo);
		model.addObject("documentSearchList",documentSearchList);
		model.setViewName("document/documentList");
		
		return model;

	}
	
	
	
	@GetMapping("/member/list")
	public String memberList() {
		
		return "document/memberList";
	}
	
	
}
