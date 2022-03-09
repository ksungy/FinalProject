package com.ww.mvc.cmt.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.cmt.model.vo.Cmt;
import com.ww.mvc.cmt.model.vo.Rest;

@Mapper
public interface CmtMapper {

	Cmt getTodayAttendance(int emp_no);

	Map<String, Object> getElapsedWTime(Map<String, Object> mapMS);

	Rest getLatestWB(Map<String, Object> mapMS);

	int countAttStart(int emp_no);

	String getAttStart(int emp_no);

	int insertCheckin(int emp_no);

	int updateCheckout(int emp_no);

	void updateBrEndForce(Map<String, Object> mapS);

	String getRestAll(Map<String, Object> mapS);

	void updateRestAll(Map<String, Object> mapS);

	String getAttEnd(int emp_no);

	int insertRestin(int emp_no);

	Rest getRestStart(int emp_no);

	int updateBrEnd(int rs_no);

	Rest getWorkBreak(int rs_no);

	Map<String, Object> getElapsedRTime(Map<String, Object> mapMS);
	
	// -
	int countAttList(int emp_no);

	// -
	List<Cmt> getAttList(int emp_no, int currentPage, int limitInOnePage);

	List<Cmt> findAll(RowBounds rowBounds);

}
