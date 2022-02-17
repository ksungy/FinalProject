package com.ww.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	
	private int no;
	
	private int empNo;
	
	private String writer;
	
	private String title;
	
	private String content;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private int hits;
	
	private int rowNum;
	
}
