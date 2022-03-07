package com.ww.mvc.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.ww.mvc.calendar.model.dao.CalenDao;
import com.ww.mvc.calendar.model.vo.Calendar;

public class CalenService {
	@Autowired(required = false) 
	private CalenDao dao; 
	
	public ArrayList<Calendar> calenList(){
		return dao.calenList();
	}

}
