package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	
	//파일경로 xml 받아옴
	@Resource(name = "uploadPath")
	private String uploadPath;

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
		
		//전체 글개수 구하기 => 디비에서 가져오기
		//int  리턴할형  getBoardCount() 메서드 정의
		//select count(*) from board
		// int count=bDAO.getBoardCount();
		int count=boardService.getBoardCount();
		
		int currentPage=Integer.parseInt(pageNum);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// 디비에서 가져온 글을 model 담아서 notice.jsp 전달
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		// /WEB-INF/views/center/notice.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "center/notice";
	}
	
	// 가상주소 http://localhost:8080/FunWeb/board/content?num=1
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		System.out.println("BoardController content() ");
		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 증가 update board set readcount=readcount+1 where num=?
		boardService.updateReadcount(num);
		
		// num에 대한 글 가져오기
		BoardDTO boardDTO=boardService.getBoard(num);
		
		// 디비에서 가져온 글을 model 담아서 content.jsp 전달
		model.addAttribute("boardDTO", boardDTO);
		
		// /WEB-INF/views/center/content.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "center/content";
	}
	
//	파일업로드-----------------------------------------------
//	가상주소 http://localhost:8080/FunWeb/fboard/fwrite
	@RequestMapping(value = "/fboard/fwrite", method = RequestMethod.GET)
	public String fwrite() {
		System.out.println("BoardController fwrite() ");
		
		// /WEB-INF/views/fcenter/fwrite.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "fcenter/fwrite";
	}
	
	@RequestMapping(value = "/fboard/fwritePro", method = RequestMethod.POST)
	public String fwritePro(HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("BoardController writePro() ");
		//파일업로드 폼에서 BoardDTO 자동으로 못가져옴
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		
		//실제 파일 file.getBytes();  =>파일이름변경 => upload폴더 복사
		// 랜덤문자_파일이름  파일이름변경
		UUID uid=UUID.randomUUID();
		String fileName=uid.toString()+"_"+file.getOriginalFilename();
		// 파일 복사 => upload폴더 파일이름
		File uploadfile=new File(uploadPath,fileName);
		FileCopyUtils.copy(file.getBytes(), uploadfile);
		
		boardDTO.setFile(fileName);
		//디비작업
		// 객체생성
//		BoardService boardService=new BoardServiceImpl();
		//메서드 호출
		boardService.writeBoard(boardDTO);
		
		// 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
		// 	response.sendRedirect("/board/list");
		return "redirect:/board/list";
	}
	
	
}//
