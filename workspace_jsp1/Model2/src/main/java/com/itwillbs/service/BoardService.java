package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;

public class BoardService {

	public void insertBoard(BoardDTO boardDTO ) {
		// name pass subject content 저장
		// num readcount date 구하기
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		boardDTO.setNum(boardDAO.getMaxNum()+1);
		
		// 디비 insert메서드 호출
		boardDAO.insertBoard(boardDTO);
	}
	
	public List getBoardList(int startRow, int pageSize) {
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		List boardList=boardDAO.getBoardList(startRow, pageSize);
		return boardList;
	}
	
	public int getBoardCount() {
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		int count=boardDAO.getBoardCount();
		return count;
	}
	
}//
