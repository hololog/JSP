package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
	//부모인터페이스 : 자식클래스를 만들기 위한 공통된 틀(공통된 메서드 틀)
	//추상메서드 : 공통된 메서드 틀
	public void insertMember(MemberDTO memberDTO);
	
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	public MemberDTO getMember(String id);
	
	public void updateMember(MemberDTO memberDTO);
	
	public List<MemberDTO> getMemberList();
	
	public void deleteMember(MemberDTO memberDTO);
	
}
