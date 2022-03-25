package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{

	//DI 의존관계 주입 객체생성
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void writeBoard(BoardDTO boardDTO) {
		// name,subject,content 폼에서 입력해서 옴
		//num,pass,readcount,date
		boardDTO.setPass("1111");
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// 글번호 :  디비에 저장된 최대번호 구해서 +1 
		if(boardDAO.getMaxNum()!=null) {
			// 글이 있는 경우 
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}else {
			// 글이 없는 경우 
			boardDTO.setNum(1);
		}
		
		
		boardDAO.writeBoard(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		// pageSize , pageNum 가져옴
		// currentPage, startRow , endRow 구하기 
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
//		select * from board order by num desc limit #{startRow}-1,#{pageSize}
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}

	@Override
	public BoardDTO getBoard(int num) {
		return boardDAO.getBoard(num);
	}

	@Override
	public void updateReadcount(int num) {
		boardDAO.updateReadcount(num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		boardDAO.deleteBoard(num);
	}

	
}//
