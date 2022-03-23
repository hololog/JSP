package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardDAO {
		// 추상메서드 정의
		public void writeBoard(BoardDTO boardDTO);
		
		public Integer getMaxNum();
		
		public List<BoardDTO> getBoardList(PageDTO pageDTO);
}
