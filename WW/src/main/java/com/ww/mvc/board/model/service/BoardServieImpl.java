package com.ww.mvc.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ww.mvc.board.model.dao.BoardMapper;
import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.board.model.vo.BoardAttach;
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

	@Override
	@Transactional
	public int save(Board board) {
	int result = 0;
		
		if(board.getNo() != 0) {
			// update
			result = mapper.updateBoard(board);
		} else {
			// insert
			result = mapper.insertBoard(board);
		}
		
//		 Attach는 n개면 n번 insert
		for(BoardAttach boardAttach : board.getAttachList()) {
			mapper.insertFile(boardAttach);
		}
		
		return result;
	}



	@Override
	public List<Board> boardSearch(Map<String, String> searchMap, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1 ) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.searchBoard(rowBounds, searchMap);
	}

	
	@Override
	public int getSearchCount() {
		
		return mapper.searchCount();
	}








	
	

}
