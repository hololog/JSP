package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 (처리담당자)
public class MemberController extends HttpServlet{
	// 가상주소  http://localhost:8080/Model2/insert.me
	
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
		// 프로젝트 경로
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		System.out.println("프로젝트경로 길이 : "+contextPath.length());
		// 가상주소 뽑기
		String substringPath=requestURI.substring(contextPath.length());
		System.out.println(substringPath);
		
	}
	
	
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
