package com.ww.mvc.board.model.service;


import java.util.List;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.common.util.PageInfo;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

}
