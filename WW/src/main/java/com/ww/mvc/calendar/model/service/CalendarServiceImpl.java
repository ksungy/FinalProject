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
	public List<Calendar> getCalendar(Calendar calen) throws Exception {
		return calendardao.getCalendar(calen);
	}
	
	@Override
	public List<Calendar> setCalendar(Calendar calen) throws Exception {
		return calendardao.setCalendar(calen);
	}

	@Override
	public List<Calendar> delCalendar(Calendar calen) throws Exception {
		return calendardao.delCalendar(calen);
	}
}
