package com.ww.mvc.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ww.mvc.board.model.dao.BoardMapper;
import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.board.model.vo.BoardAttach;
import com.ww.mvc.board.model.vo.Reply;
import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.member.model.vo.Member;

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

	@Override
	public int delete(int no) {
		
		return mapper.deleteBoard(no);
	}

	// 댓글 작성
	@Override
	@Transactional
	public int saveReply(Member member, Reply reply) {
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("content", reply.getContent());
		map.put("boardNo", reply.getBoardNo());
		map.put("empNo", member.getNo());
		map.put("writer", member.getId());
		
		return mapper.insertReply(map);
	}








	
	

}
