package com.ww.mvc.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class document_controller {
	
	@GetMapping("/document/list")
	public String documentList() {
		
		return "document/documentList";
	}
	
	@GetMapping("/member/list")
	public String memberList() {
		
		return "document/memberList";
	}
	
}