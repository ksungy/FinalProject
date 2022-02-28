package com.ww.mvc.board.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.common.util.PageInfo;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

	Board findBoardByNo(int no);

	int save(Board board);


}
