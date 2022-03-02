package com.ww.mvc.cmt.model.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cmt {
	private int cmt_no;
	
	private int emp_id;
	
	private Date cmt_srt_time;
	
	private Date cmt_end_time;
	
	private double cmt_time;
	
	private Date cmt_date;
	
	private double cmt_total_time;
	
	private double cmt_over_time;
	
	private int cmt_month;

}
