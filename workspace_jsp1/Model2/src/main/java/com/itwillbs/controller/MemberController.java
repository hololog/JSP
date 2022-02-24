package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

//서블릿 (처리담당자)
public class MemberController extends HttpServlet{
	// 가상주소  http://localhost:8080/Model2/insert.me
	//가상주소   http://localhost:8080/Model2/insertPro.me
	// 가상주소  http://localhost:8080/Model2/login.me
	
	// 서블릿 자동으로 메서드 동작 doGet() , doPost(), service()
	// 가상주소 => 실제 jsp, 자바메서드 연결
	
 
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController 서블릿  doPro()");
		// => 처리담당자  가상주소 insert.me     파일 insertForm.jsp  연결시켜주는 명령
		// =>           가상주소 insertPro.me  자바 insertPro메서드 호출 (자바 디비메서드호출)
		
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
		
		if(substringPath.equals("/insert.me")) {
//			insertForm.jsp 이동 
			// 1. 하이퍼링크 2.location.href 3. response.sendRedirect()
//			response.sendRedirect("member/insertForm.jsp");
			
			// 가상주소 http://localhost:8080/Model2/insert.me 주소줄에 보이면서
			// 실행화면 member/insertForm.jsp 보이기
//			forward이동방식 => /insert.me 주소줄에 유지 실행화면 member/insertForm.jsp 보이기
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/insertForm.jsp");
			dispatcher.forward(request, response);
		} else if(substringPath.equals("/insertPro.me")) {
//			=> 가상주소 insertPro.me  자바 insertPro메서드 호출 (자바 디비메서드호출) 
//			주소매핑 => 처리작업 자바파일 MemberService 메서드 => 디비작업 자바파일  MemberDAO
			
			request.setCharacterEncoding("utf-8");
			MemberDTO memberDTO=new MemberDTO();
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPass(request.getParameter("pass"));
			memberDTO.setName(request.getParameter("name"));
			
//			MemberService 객체생성
			MemberService memberService=new MemberService();
//			insertPro() 메서드 호출
			memberService.insertPro(memberDTO);
			// 로그인 이동
			response.sendRedirect("login.me");
		}else if(substringPath.equals("/login.me")) {
			//  member/loginForm.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/loginForm.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/loginPro.me")) {
			// id, pass 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			// MemberService 객체생성 
			MemberService memberService=new MemberService();
			// MemberDTO memberDTO= userCheck(id,pass)메서드 호출
			MemberDTO memberDTO=memberService.userCheck(id, pass);
			// memberDTO !=null 아니면 
			// 세션값 생성
			if(memberDTO!=null) {
//				session 객체생성
				HttpSession session=request.getSession();
				session.setAttribute("id", id);
				// member/main.jsp
//				RequestDispatcher dispatcher=request.getRequestDispatcher("member/main.jsp");
//				dispatcher.forward(request, response);
				// main.me
				response.sendRedirect("main.me");
			}else {
				//뒤로이동  자바에서 자바스크립트 사용  자바에서 html출력
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('입력하신 정보가 틀림');");
				out.println("history.back();");
				out.println("</script>");
			}
			

		}else if(substringPath.equals("/main.me")) {
			// member/main.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/main.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/logout.me")) {
//			session 객체생성
			HttpSession session=request.getSession();
			//세션 초기화
			session.invalidate();
			// main.me 이동
			response.sendRedirect("main.me");
		}else if(substringPath.equals("/info.me")) {
//			session 객체생성
			HttpSession session=request.getSession();
			// String id = 세션값 가져오기
			String id=(String)session.getAttribute("id");
			// MemberService 객체생성
			MemberService memberService=new MemberService();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			MemberDTO memberDTO =memberService.getMember(id);
			// memberDTO데이터를 request 담아서 들고
			request.setAttribute("memberDTO", memberDTO);
			// member/info.jsp 주소가 변경되지 않고 request 정보를 들고 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/info.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/update.me")) {
//			session 객체생성
			HttpSession session=request.getSession();
			// String id = 세션값 가져오기
			String id=(String)session.getAttribute("id");
			// MemberService 객체생성
			MemberService memberService=new MemberService();
			// MemberDTO memberDTO = getMember(id) 메서드 호출
			MemberDTO memberDTO =memberService.getMember(id);
			// memberDTO데이터를 request 담아서 들고
			request.setAttribute("memberDTO", memberDTO);
			// member/updateForm.jsp 주소가 변경되지 않고 request 정보를 들고 이동
RequestDispatcher dispatcher=request.getRequestDispatcher("member/updateForm.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/updatePro.me")) {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// id, pass, name 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			String name=request.getParameter("name");
			// MemberDTO updateDTO 객체생성
			MemberDTO updateDTO=new MemberDTO();
			// 멤버변수 <= 파라미터 가져오기
			updateDTO.setId(id);
			updateDTO.setPass(pass);
			updateDTO.setName(name);
			
			// MemberService 객체생성 
			MemberService memberService=new MemberService();
			// MemberDTO memberDTO= userCheck(id,pass)메서드 호출
			MemberDTO memberDTO=memberService.userCheck(id, pass);
			if(memberDTO!=null) {
				//  updateMember(updateDTO) 메서드호출
				memberService.updateMember(updateDTO);
				// main.me 이동
				response.sendRedirect("main.me");
			}else {
				//뒤로이동  자바에서 자바스크립트 사용  자바에서 html출력
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('입력하신 정보가 틀림');");
				out.println("history.back();");
				out.println("</script>");
			}
		}else if(substringPath.equals("/delete.me")) {
			// member/deleteForm.jsp 주소가 변경되지 않고 request 정보를 들고 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/deleteForm.jsp");
			dispatcher.forward(request, response);
		}else if(substringPath.equals("/deletePro.me")) {
			// id pass 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			// MemberService 객체생성 
			MemberService memberService=new MemberService();
			// MemberDTO memberDTO= userCheck(id,pass)메서드 호출
			MemberDTO memberDTO=memberService.userCheck(id, pass);
			if(memberDTO!=null) {
				//  deleteMember(id) 메서드호출
				memberService.deleteMember(id);
//				session 객체생성
				HttpSession session=request.getSession();
				//세션값 초기화
				session.invalidate();
				// main.me 이동
				response.sendRedirect("main.me");
			}else {
				//뒤로이동  자바에서 자바스크립트 사용  자바에서 html출력
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('입력하신 정보가 틀림');");
				out.println("history.back();");
				out.println("</script>");
			}
		}else if(substringPath.equals("/list.me")) {
//			MemberService 객체생성
			MemberService memberService=new MemberService();
//			List memberList= getMemberList() 호출
			List memberList=memberService.getMemberList();
			// request에  memberList 담아서 전달 
			request.setAttribute("memberList", memberList);
			//  member/list.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/list.jsp");
			dispatcher.forward(request, response);
		}
		
	}//
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController 서블릿  doGet()");
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController 서블릿  doPost()");
		doPro(request, response);
	}

	
}
