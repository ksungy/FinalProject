package com.ww.mvc.calendar.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ww.mvc.calendar.model.vo.Calendar;

@Repository("calendarDao")
public class CalendarDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Calendar> getCalendar(Calendar calen) throws Exception {
		List<Calendar> calendar = null;
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("empNo", calen.getEmpNo());
		
		calendar = sqlSession.selectList("Calendar.calendarList", map);
		
		return calendar;
		
	}

	public List<Calendar> setCalendar(Calendar calen) throws Exception {
		List<Calendar> calendar = null;
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("empNo", calen.getEmpNo());
		map.put("calendarTitle", calen.getCalendarTitle());
		map.put("calendarStart", calen.getCalendarStart());
		map.put("calendarEnd", calen.getCalendarEnd());
		
		calendar = sqlSession.selectList("Calendar.calendarInsert", map);
		
		return calendar;
		
	}

	public List<Calendar> delCalendar(Calendar calen) {
		List<Calendar> calendar = null;
		
		Map<Object, Object> map = new HashMap<Object, Object>();

		map.put("calendarTitle", calen.getCalendarTitle());
		
		calendar = sqlSession.selectList("Calendar.calendarDelete", map);
		
		return calendar;
	}
	
}
