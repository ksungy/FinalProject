package com.ww.mvc.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ww.mvc.calendar.model.dao.CalendarDao;
import com.ww.mvc.calendar.model.vo.Calendar;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao calendardao;
	
	@Override
	public List<Calendar> getCalendar() throws Exception {
		return calendardao.getCalendar();
	}
}
