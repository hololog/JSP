package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;

@Controller
public class MemberController {

//	사용자 가상주소 http://localhost:8080/myweb/member/insert
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		System.out.println("MemberController insert() ");
		
		// 1. 하이퍼링크 2.location.href 3. response.sendRedirect()
        //		response.sendRedirect("member/insertForm.jsp");
		
		// 2. 가상주소 http://localhost:8080/myweb/member/insert 주소줄에 보이면서
		// 실행화면 member/insertForm.jsp 보이기
//		forward이동방식 => /member/insert 주소줄에 유지 실행화면 member/insertForm.jsp 보이기
//		RequestDispatcher dispatcher=request.getRequestDispatcher("member/insertForm.jsp");
//		dispatcher.forward(request, response);
		
		// /WEB-INF/views/member/insertForm.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "member/insertForm";
	}
	
	
//	사용자 가상주소 http://localhost:8080/myweb/member/insertPro
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		//insertPro(HttpServletRequest request)
		System.out.println("MemberController insertPro() ");
//		String id=request.getParameter("id");
//		String pass=request.getParameter("pass");
//		String name=request.getParameter("name");
//		
//		MemberDTO memberDTO=new MemberDTO();
//		memberDTO.setId(id);
//		memberDTO.setPass(pass);
//		memberDTO.setName(name);
		// insertForm.jsp에서 태그 name="id" 와  MemberDTO 멤버변수 id => 일치하면 자동으로 저장
		
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());
		
		// 가상주소 로그인주소 이동 /member/login (주소줄에 주소가 바뀌면서 이동)
		// 	response.sendRedirect("member/login");
		return "redirect:/member/login";
	}
	
//	사용자 가상주소 http://localhost:8080/myweb/member/login
	// System.out.println("HomeController login() ");
	// loginForm.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("MemberController login() ");
		
		return "member/loginForm";
	}
	
	//	사용자 가상주소 http://localhost:8080/myweb/member/loginPro
	// System.out.println("HomeController loginPro() ");
	// 가상주소 로그인주소 이동 /member/main (주소줄에 주소가 바뀌면서 이동)
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO) {
		System.out.println("MemberController loginPro() ");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		
		return "redirect:/member/main";
	}	
	
//	사용자 가상주소 http://localhost:8080/myweb/member/main
	// System.out.println("MemberController main() ");
	// member/main.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("MemberController main() ");
		
		return "member/main";
	}
	
//	사용자 가상주소 http://localhost:8080/myweb/member/info
	// System.out.println("MemberController info() ");
	// member/info.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info() {
		System.out.println("MemberController info() ");
		
		return "member/info";
	}
	
	
//	사용자 가상주소 http://localhost:8080/myweb/member/update
	// System.out.println("MemberController update() ");
	// member/updateForm.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update() {
		System.out.println("MemberController update() ");
		return "member/updateForm";
	}
	
	//	사용자 가상주소 http://localhost:8080/myweb/member/updatePro
	// System.out.println("MemberController updatePro() ");
	// 가상주소 로그인주소 이동 /member/main (주소줄에 주소가 바뀌면서 이동)
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro() {
		System.out.println("MemberController updatePro() ");
		return "redirect:/member/main";
	}
	
//	사용자 가상주소 http://localhost:8080/myweb/member/delete
	// System.out.println("MemberController delete() ");
	// member/deleteForm.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
		System.out.println("MemberController delete() ");
		return "member/deleteForm";
	}
	
	//	사용자 가상주소 http://localhost:8080/myweb/member/deletePro
	// System.out.println("MemberController deletePro() ");
	// 가상주소 로그인주소 이동 /member/main (주소줄에 주소가 바뀌면서 이동)
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro() {
		System.out.println("MemberController deletePro() ");
		return "redirect:/member/main";
	}
	
//	사용자 가상주소 http://localhost:8080/myweb/member/list
	// System.out.println("MemberController list() ");
	// member/list.jsp 이동  주소줄이 안바뀌면서 이동
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list() {
		System.out.println("MemberController list() ");
		return "member/list";
	}
	
}//
