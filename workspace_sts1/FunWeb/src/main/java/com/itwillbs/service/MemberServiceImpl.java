package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.MemberDAOImpl;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
//	MemberDAO memberDAO=new MemberDAOImpl();
	//객체생성
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		//회원가입 날짜 설정
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println("MemberServiceImpl insertMember()");
//	객체생성
//		MemberDAO memberDAO=new MemberDAOImpl();
//	메서드호출
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl userCheck()");
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		System.out.println("MemberServiceImpl getMember()");
		return memberDAO.getMember(id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		memberDAO.updateMember(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		memberDAO.deleteMember(memberDTO);
	}

}//
