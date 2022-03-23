package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	// 객체생성 : xml에서 객체생성 set메서드 호출 전달(주입)
	// DI(의존관계주입)
//	BoardService boardService=new BoardServiceImpl();
	@Inject
	private BoardService boardService;

//	가상주소 http://localhost:8080/FunWeb/board/write
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String write() {
		System.out.println("BoardController write() ");
		
		// /WEB-INF/views/center/write.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "center/write";
	}
	
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String writePro(BoardDTO boardDTO) {
		System.out.println("BoardController writePro() ");
		//디비작업
		// 객체생성
//		BoardService boardService=new BoardServiceImpl();
		//메서드 호출
		boardService.writeBoard(boardDTO);
		
		// 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
		// 	response.sendRedirect("/board/list");
		return "redirect:/board/list";
	}
	
//	가상주소 http://localhost:8080/FunWeb/board/list
//	가상주소 http://localhost:8080/FunWeb/board/list?pageNum=3
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		System.out.println("BoardController list() ");
		// 한화면에 보여줄 글개수 설정
		int pageSize=15;
		
		// pageNum 파라미터값 가져오기 => 없으면 1페이지 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		// 디비에서 가져온 글을 model 담아서 notice.jsp 전달
		model.addAttribute("boardList", boardList);
		
		// /WEB-INF/views/center/notice.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "center/notice";
	}
	
	
}//
