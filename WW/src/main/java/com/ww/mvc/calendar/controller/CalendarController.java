package com.ww.mvc.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ww.mvc.calendar.model.service.CalenService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@Autowired(required = false) 
	private CalenService service;
	
	@GetMapping(params="method=list")
	public String list() {
		log.info("11");
		return "calendar/calendar";
	}

	@GetMapping(params="method=data")
	public String data(Model d) {
		d.addAttribute("list", service.calenList()); 
		log.info("22");
		return "pageJsonReport"; 
	}
	
}