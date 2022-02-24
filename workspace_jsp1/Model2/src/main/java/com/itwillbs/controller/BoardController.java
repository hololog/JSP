package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

public class BoardController extends HttpServlet{

	// 가상주소  http://localhost:8080/Model2/write
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardController doPro()");
		// 가상주소 뽑기
		// url 주소  http://localhost:8080/Model2/insert.me
		String requestURL=request.getRequestURL().toString();
		System.out.println(requestURL);
		// url 주소에서 서버주소를 뺀 나머지 주소  /Model2/insert.me
		String requestURI=request.getRequestURI();
		System.out.println(requestURI);
		// 프로젝트 경로  /Model2
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		System.out.println("프로젝트경로 길이 : "+contextPath.length());
		// 가상주소 뽑기   /insert.me
		String substringPath=requestURI.substring(contextPath.length());
		System.out.println(substringPath);
		
		// 주소비교 
		if(substringPath.equals("/write")) {
			// board/writeForm.jsp 이동  
//			forward이동방식 => /write 주소줄에 유지 실행화면 board/writeForm.jsp 보이기
			RequestDispatcher dispatcher=request.getRequestDispatcher("board/writeForm.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/writePro")) {
			request.setCharacterEncoding("utf-8");
			// BoardDTO 객체생성
			BoardDTO boardDTO=new BoardDTO();
			// set호출 request파라미터값 저장
			boardDTO.setName(request.getParameter("name"));
			boardDTO.setPass(request.getParameter("pass"));
			boardDTO.setSubject(request.getParameter("subject"));
			boardDTO.setContent(request.getParameter("content"));
			// BoardService 객체생성
			BoardService boardService=new BoardService();
			// insertBoard(BoardDTO 주소)  호출
			boardService.insertBoard(boardDTO);
			// 이동  가상주소 list 
			response.sendRedirect("list");
		}else if(substringPath.equals("/list")) {
			// 페이지번호 없으면 1로 설정
			// http://localhost:8080/Model2/list   
			// 페이지번호가 있으면 받은 페이지번호로 설정
			// http://localhost:8080/Model2/list?pageNum=2 
			//페이징 처리
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
				// 페이지번호 없으면 1로 설정
				pageNum="1";
			}
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1;
			int endRow = startRow+pageSize-1;
			
			// BoardService 객체생성
			BoardService boardService=new BoardService();
//			List boardList =getBoardList(startRow, pageSize);
			List boardList=boardService.getBoardList(startRow, pageSize);
			
//			int count=getBoardCount() 메서드호출
			int count=boardService.getBoardCount();
			
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setCount(count);
			pageDTO.setPageCount(pageCount);
			pageDTO.setEndPage(endPage);
			
			// request 데이터 저장
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageDTO", pageDTO);
			
			// 이동 board/list.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("board/list.jsp");
			dispatcher.forward(request, response);
		}
		
	}//
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

}
