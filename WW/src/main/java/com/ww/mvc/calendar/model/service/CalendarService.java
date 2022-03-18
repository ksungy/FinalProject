package com.ww.mvc.calendar.model.service;

import java.util.List;

import com.ww.mvc.calendar.model.vo.Calendar;

public interface CalendarService {
	List<Calendar> getCalendar(Calendar calen) throws Exception;

	List<Calendar> setCalendar(Calendar calen) throws Exception;

	List<Calendar> delCalendar(Calendar calen) throws Exception;
}
