package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	// 마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	//sql구문 전체 이름 변수 정의
	private static final String namespace="com.itwillbs.mappers.boardMapper";
	
	@Override
	public void writeBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writeBoard", boardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(namespace+".getBoardCount");
	}

	@Override
	public BoardDTO getBoard(int num) {
		return sqlSession.selectOne(namespace+".getBoard", num);
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace+".updateReadcount", num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updateBoard", boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		sqlSession.delete(namespace+".deleteBoard", num);
	}

}//
