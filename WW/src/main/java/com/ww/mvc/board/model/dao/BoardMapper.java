package com.ww.mvc.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.common.util.SearchInfo;

@Mapper
public interface BoardMapper {

	int getBoardCount();

	List<Board> findAll(RowBounds rowBounds);

	Board selectBoardByNo(int no);

	int updateBoard(Board board);

	int insertBoard(Board board);

	List<Board> searchBoard(RowBounds rowBounds, Map<String, String> searchMap);

	int searchCount();


}
