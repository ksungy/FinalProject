package com.ww.mvc.board.model.service;


import java.util.List;
import java.util.Map;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.board.model.vo.Reply;
import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.member.model.vo.Member;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

	Board findBoardByNo(int no);

	int save(Board board);

	List<Board> boardSearch(Map<String, String> searchMap, PageInfo pageInfo);

	int getSearchCount();

	int delete(int no);

	int saveReply(Member member, Reply reply);

	int deleteReply(int no);

	int updateReply(Reply reply);

	int getReplyCount(int no);

	

	

	

	
	


}
