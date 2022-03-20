package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	//부모인터페이스 : 자식클래스를 만들기 위한 공통된 틀(공통된 메서드 틀)
	//추상메서드 : 공통된 메서드 틀
	public void insertMember(MemberDTO memberDTO);
	// MemberDTO checkMemberDTO=memberService.userCheck(memberDTO);
	public MemberDTO userCheck(MemberDTO memberDTO);
	
//	MemberDTO memberDTO=memberService.getMember(id);
	public MemberDTO getMember(String id);
	
//	memberService.updateMember(memberDTO);
	public void updateMember(MemberDTO memberDTO);
	
//	List<MemberDTO> memberList=memberService.getMemberList();
	public List<MemberDTO> getMemberList();
}
