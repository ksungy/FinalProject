package com.ww.mvc.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ww.mvc.board.model.dao.BoardMapper;
import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.common.util.PageInfo;

@Service
public class BoardServieImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public int getBoardCount() {
		
		return mapper.getBoardCount();
	}

	@Override
	public List<Board> getBoardList(PageInfo pageInfo) {
		
		 int offset = (pageInfo.getCurrentPage() - 1 ) * pageInfo.getListLimit();
		 int limit = pageInfo.getListLimit();
		 RowBounds rowBounds = new RowBounds(offset, limit);

		 return mapper.findAll(rowBounds);
		 
	}

	@Override
	public Board findBoardByNo(int no) {
		
		return mapper.selectBoardByNo(no);
	}

}
