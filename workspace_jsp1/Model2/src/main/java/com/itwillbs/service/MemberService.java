package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	//처리담당
	public void insertPro(MemberDTO memberDTO) {
		System.out.println("MemberService insertPro()");
		//시스템 날짜 구하기
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
//		MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
//		insertMember() 메서드 호출
		memberDAO.insertMember(memberDTO);
	}//
	
	public MemberDTO userCheck(String id,String pass) {
		System.out.println("MemberService userCheck()");
//		MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
//		MemberDTO memberDTO= userCheck()메서드 호출
		MemberDTO memberDTO=memberDAO.userCheck(id, pass);
		return memberDTO;
	}//
	
	public MemberDTO getMember(String id) {
//		MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=memberDAO.getMember(id);
		return memberDTO;
	}
	
	public void updateMember(MemberDTO updateDTO) {
		MemberDAO memberDAO=new MemberDAO();
		memberDAO.updateMember(updateDTO);
	}
	
	public void deleteMember(String id) {
		MemberDAO memberDAO=new MemberDAO();
		memberDAO.deleteMember(id);
	}
	
	public List getMemberList() {
		MemberDAO memberDAO=new MemberDAO();
		List memberList=memberDAO.getMemberList();
		return memberList;
	}
	
}//
