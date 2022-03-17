package com.ww.mvc.document.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("/document/list")
	public ModelAndView documentList(ModelAndView model,
			@RequestParam(defaultValue = "1") int page) {
		
		int documentListCount = 0;
		
		//(현재 페이지, 한페이지에 리스트수, 전체리스트 수, 한 페이지에 표시된 리스트수)
		documentListCount = serivce.getDocumentCount();
		log.info("{}",documentListCount);
		PageInfo pageInfo = new PageInfo(page, 10, documentListCount, 10);
		List<Document> documentLest = serivce.getDocumentList(pageInfo);
		
		model.addObject("pageInfo",pageInfo);
		model.addObject("documentLest",documentLest);
		model.setViewName("document/documentList");
		
		return model;
	}
	
	@GetMapping("/member/list")
	public String memberList() {
		
		return "document/memberList";
	}
	
}
