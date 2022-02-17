package com.ww.mvc.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.board.model.vo.Board;

@Mapper
public interface BoardMapper {

	int getBoardCount();

	List<Board> findAll(RowBounds rowBounds);

}
