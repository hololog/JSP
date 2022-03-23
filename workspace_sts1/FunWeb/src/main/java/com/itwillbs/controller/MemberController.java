package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
	
//	MemberService memberService=new MemberServiceImpl();
	// 스프링에서 객체생성 DI 의존관계주입 : 
	// MemberServiceImpl xml에서 객체생성해서 set메서드 호출해서 객체생성된 주소값 전달
	// xml 객체생성, set메서드 생략하고 자동화
	@Inject
	private MemberService memberService;
	
//	가상주소 http://localhost:8080/FunWeb/member/insert
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		System.out.println("MemberController insert() ");
		
		// /WEB-INF/views/member/join.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/join";
	}
	
//	<%=request.getContextPath() %>/member/joinPro
//	가상주소 http://localhost:8080/FunWeb/member/joinPro
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro() ");
		//디비작업
		//회원가입 메서드호출 
		// 패키지  com.itwillbs.service  인터페이스 MemberService 
		// 클래스 MemberServiceImpl insertMember(memberDTO)메서드호출 
		// 객체생성
//		MemberService memberService=new MemberServiceImpl();
		//메서드 호출
		memberService.insertMember(memberDTO);
		
		// =>패키지 com.itwillbs.dao  인터페이스 MemberDAO
		// 클래스 MemberDAOImpl insertMember(memberDTO)
	
		// 가상주소 로그인주소 이동 /member/login (주소줄에 주소가 바뀌면서 이동)
		// 	response.sendRedirect("member/login");
		return "redirect:/member/login";
	}

//	가상주소 http://localhost:8080/FunWeb/member/login
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("MemberController login() ");
		
		// /WEB-INF/views/member/login.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/login";
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/loginPro
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		System.out.println("MemberController loginPro() ");
		//디비작업
		//아이디 비밀번호 일치 
		// 객체생성
//		MemberService memberService=new MemberServiceImpl();
		//메서드 호출
		MemberDTO checkMemberDTO=memberService.userCheck(memberDTO);
		if(checkMemberDTO!=null) {
			//아이디 비밀번호 일치
			//세션값 생성
			session.setAttribute("id", memberDTO.getId());
			// 가상주소 로그인주소 이동 /main/main (주소줄에 주소가 바뀌면서 이동)
			// 	response.sendRedirect("main/main");
			return "redirect:/main/main";
		}else {
			//null 이면 아이디 비밀번호 틀림  "입력하신 정보는 틀림" 뒤로이동
			//  /WEB-INF/views/member/msg.jsp
			return "member/msg";
		}
	}	
	
//	가상주소 http://localhost:8080/FunWeb/main/main
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("MemberController main() ");
		
		// /WEB-INF/views/main/main.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "main/main";
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("MemberController logout() ");
		//세션초기화
		session.invalidate();
		// 가상주소 로그인주소 이동 /main/main (주소줄에 주소가 바뀌면서 이동)
		// 	response.sendRedirect("main/main");
		return "redirect:/main/main";
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/update
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		System.out.println("MemberController update() ");
		//세션값 가져오기
		String id=(String)session.getAttribute("id");
		//수정하기전에 세션 회원정보 디비 가져오기
		MemberDTO memberDTO=memberService.getMember(id);
		// Model 데이터 담아서 jsp 에 전달
		model.addAttribute("memberDTO", memberDTO);
		// /WEB-INF/views/member/update.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/update";
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/updatePro
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro() ");
		//디비작업
		//아이디 비밀번호 일치 
		// 객체생성
//		MemberService memberService=new MemberServiceImpl();
		//메서드 호출
		MemberDTO checkMemberDTO=memberService.userCheck(memberDTO);
		if(checkMemberDTO!=null) {
			//아이디 비밀번호 일치
			//수정
			memberService.updateMember(memberDTO);
			// 가상주소 로그인주소 이동 /main/main (주소줄에 주소가 바뀌면서 이동)
			// 	response.sendRedirect("main/main");
			return "redirect:/main/main";
		}else {
			//null 이면 아이디 비밀번호 틀림  "입력하신 정보는 틀림" 뒤로이동
			//  /WEB-INF/views/member/msg.jsp
			return "member/msg";
		}
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/delete
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
		System.out.println("MemberController delete() ");
		
		// /WEB-INF/views/member/delete.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/delete";
	}
	
//	가상주소 http://localhost:8080/FunWeb/member/deletePro
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController deletePro() ");
		//디비작업
		//아이디 비밀번호 일치 
		// 객체생성
//		MemberService memberService=new MemberServiceImpl();
		//메서드 호출
		MemberDTO checkMemberDTO=memberService.userCheck(memberDTO);
		if(checkMemberDTO!=null) {
			//아이디 비밀번호 일치
			//수정
			memberService.deleteMember(memberDTO);
			//세션값 초기화
			session.invalidate();
			// 가상주소 로그인주소 이동 /main/main (주소줄에 주소가 바뀌면서 이동)
			// 	response.sendRedirect("main/main");
			return "redirect:/main/main";
		}else {
			//null 이면 아이디 비밀번호 틀림  "입력하신 정보는 틀림" 뒤로이동
			//  /WEB-INF/views/member/msg.jsp
			return "member/msg";
		}
	}
	
	
	
//	가상주소 http://localhost:8080/FunWeb/member/list
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list( Model model) {
		System.out.println("MemberController list() ");
		//모든 회원정보 디비 가져오기
		List<MemberDTO> memberList=memberService.getMemberList();
		// Model 데이터 담아서 jsp 에 전달
		model.addAttribute("memberList", memberList);
		// /WEB-INF/views/member/list.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/list";
	}
	
	
}//
