package com.ww.mvc.cmt.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Component
public class Cmt {
	private int cmt_no;
	
	private int emp_no;
	
	private String cmt_srt;
	
	private String cmt_end;
	
	private String cmt_rs;
	
	public Cmt(int cmt_no, int emp_no, String cmt_srt, String cmt_end, String cmt_rs) {
		super();
		this.cmt_no = cmt_no;
		this.emp_no = emp_no;
		this.cmt_srt = cmt_srt;
		this.cmt_end = cmt_end;
		this.cmt_rs = cmt_rs;
	}	
}
