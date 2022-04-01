package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	//객체생성
	@Inject
	private MemberService memberService;
	
	@Inject
	private BoardService boardService;
	
//	가상주소 http://localhost:8080/FunWeb/member/userCheck2
	@RequestMapping(value = "/member/userCheck2", method = RequestMethod.GET)
	public ResponseEntity<String> userCheck2(HttpServletRequest request) {
		System.out.println("AjaxController userCheck2() ");
		String result="";
//		data:{"id":$('#id').val()},
		String id=request.getParameter("id");
		MemberDTO memberDTO =memberService.getMember(id);
		if(memberDTO!=null) {
			//아이디 일치 => 아이디 중복
			result="iddup";
		}else {
			//아이디 틀림 => 아이디 사용가능
			result="idok";
		}
		ResponseEntity<String> entity=new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
//	가상주소 http://localhost:8080/FunWeb/main/mainjson
	@RequestMapping(value = "/main/mainjson", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> mainjson() {
		int pageSize=5;
		String pageNum ="1";
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		
ResponseEntity<List<BoardDTO>> entity=new ResponseEntity<List<BoardDTO>>(boardList,HttpStatus.OK);
		return entity;
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/testidcheck
	@RequestMapping(value = "/member/testidcheck", method = RequestMethod.GET)
	public ResponseEntity<String> testidcheck(HttpServletRequest request){
		String result="";
		String id=request.getParameter("id");
		MemberDTO memberDTO=memberService.getMember(id);
		if(memberDTO!=null) {
			//아이디 있음 => 아이디 중복
			result="iddup";
		}else {
			//아이디 없음 => 아이디 사용가능
			result="idok";
		}
		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
//	가상주소 http://localhost:8080/FunWeb/board/boardjson
	@RequestMapping(value = "/board/boardjson", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> boardjson(HttpServletRequest request){
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(10);
		pageDTO.setPageNum("1");
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
ResponseEntity<List<BoardDTO>> entity=new ResponseEntity<List<BoardDTO>>(boardList , HttpStatus.OK);
		
		return entity;
	}
	
}//
