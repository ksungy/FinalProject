package com.ww.mvc.calendar.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ww.mvc.calendar.model.vo.Calendar;

@Repository
public interface CalenDao {
	public ArrayList<Calendar> calenList();

}
