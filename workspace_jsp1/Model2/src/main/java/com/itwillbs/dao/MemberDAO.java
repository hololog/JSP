package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.domain.MemberDTO;


public class MemberDAO {
	//디비작업
	//멤버변수 
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	//멤버함수(메서드)
	
	//데이터 베이스 연결 메서드 정의 
	// throws Exception 메서드 호출하는 곳에서 예외처리 함
	public Connection getConnection() throws Exception{
//		 // 1단계 드라이버 불러오기
//		 Class.forName("com.mysql.jdbc.Driver");
//		 // 2단계 디비연결
//		 String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
//		 String dbId="root";
//		 String dbPass="1234";
//		 con=DriverManager.getConnection(dbUrl, dbId, dbPass);	
//		 return con;
		
		// JDBC 설치
		// WEB-INF - lib - mysql-connector-java-5.1.39-bin.jar
		//DataBase Connection Pool : 미리 서버에서 연결하고 연결정보를 저장
		//                           필요할때 연결자원의 이름을 불러서 사용
		// 수정 1회 최소화, 성능 높아짐 
		// META-INF context.xml
		
		//  context.xml 불러오기 위해 객체생성  import javax.naming.Context;
		Context init=new InitialContext();
		// 자원이름 찾아서 불러오기 javax.sql.DataSource
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		// 디비연결
		con=ds.getConnection();
		return con;
		
	}
	
	// 예외 상관없이 마무리 작업(insert작업이 끝나면 기억장소 정리) =>메서드 정의
	public void dbClose() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	// 자바파일에 메서드(멤버함수) 만들기
	// 회원가입 insert 메서드(String id,String pass,String name,Timestamp date)
	// 회원가입 insert 메서드(바구니주소를 저장할 변수)
	public void insertMember(MemberDTO mDTO) {
		System.out.println("MemberDAO insertMember()");
		System.out.println("폼에서 받아온 바구니주소"+mDTO);
		System.out.println("폼에서 받아온 바구니에 저장된 아이디 : "+mDTO.getId());
		System.out.println("폼에서 받아온 바구니에 저장된 비밀번호 : "+mDTO.getPass());
		System.out.println("폼에서 받아온 바구니에 저장된 이름 : "+mDTO.getName());
		System.out.println("폼에서 받아온 바구니에 저장된 날짜 : "+mDTO.getDate());
		
		// 1드라이버로더,2디비연결,3sql,4실행
		// 외부파일, 외부디비서버 연결하기위해서 에러가 발생할 가능성이 많음
		// 자바에서 에러,오류(예외) 대비해서 에러처리구문 만들어 놓음
		
		try {
			// 예외가 발생할 가능성이 높은 코드 
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			 con=getConnection();
			 
			 // 3단계 sql 구문 만들기 insert
			 String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mDTO.getId());
			 pstmt.setString(2, mDTO.getPass());
			 pstmt.setString(3, mDTO.getName());
			 pstmt.setTimestamp(4, mDTO.getDate());
			 // 4단계 실행
			 pstmt.executeUpdate();
			 
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 명령
			// 예외 발생 메시지 출력
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(insert작업이 끝나면 기억장소 정리)
			dbClose();
		}
		return;
	}//insertMember()메서드
	
// 리턴할형 MemberDTO  메서드이름(전달할 값의 변수) userCheck(String id,String pass) 메서드 정의
	public MemberDTO userCheck(String id,String pass) {
		MemberDTO mDTO=null;
		try {
			//예기치 못한 에러 발생 할 명령
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			 con=getConnection();
			 
			// 3단계 sql 구문 만들기 select * from member where id=? and pass=?
			String sql="select * from member where id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// 4단계 sql 구문 실행 => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 다음행으로 이동 데이터 있으면 true  mDTO 객체생성  멤버변수에 열접근해서 값저장
			if(rs.next()){
				//아이디 비밀번호 일치
				mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			//에러 발생 시 처리(에러 메시지 출력)
			e.printStackTrace();
		}finally {
			// 에러 상관없이 처리(마무리)
			dbClose();
		}
		return mDTO;
	}//
	
	// 리턴할형 MemberDTO  메서드이름(전달할 값의 변수) getMember(String id) 메서드 정의
	public MemberDTO getMember(String id) {
		MemberDTO mDTO=null;
		try {
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			con=getConnection();
			
			// 3단계 sql구문 만들기  select * from member where id=?
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 sql 구문 실행 => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 결과 있으면(아이디 일치) - (행접근)다음행(rs.next()) - 열접근 -> 저장
			if(rs.next()){
				// true 아이디 일치
				// MemberDTO 객체생성
				mDTO=new MemberDTO();
				// 열 -> MemberDTO 멤버변수 저장 set메서드 호출
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			dbClose();
		}
		return mDTO;
	}//
	
	// 리턴할형없음  메서드이름(전달할 값의 변수) updateMember(MemberDTO updateDTO) 메서드 정의
	public void updateMember(MemberDTO updateDTO) {
		try {
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			 con=getConnection();
			
//		 	3단계 update구문만들기 update member set name=? where id=? 
		 	String sql="update member set name=? where id=?";	
		 	pstmt=con.prepareStatement(sql);
		 	pstmt.setString(1, updateDTO.getName());
		 	pstmt.setString(2, updateDTO.getId());
		 	//4단계 sql구문 실행 	
		 	pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			dbClose();
		}
		return;
	}//
	
	// 리턴할형없음  메서드이름(전달할 값의 변수) deleteMember(String id) 메서드 정의
	public void deleteMember(String id) {
		try {
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			con=getConnection();
			
		 	//3단계 delete구문만들기 delete from member where id=?
		 	String sql="delete from member where id=?";	
		 	pstmt=con.prepareStatement(sql);
		 	pstmt.setString(1, id);
		 	//4단계 sql구문 실행 	
		 	pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			dbClose();
		}
	}//
	
	// List 리턴할형   getMemberList() 메서드 정의 
	public List getMemberList() {
		List memberList=new ArrayList();
		try {
			//1,2 디비연결
			con=getConnection();
			//3sql
			String sql="select * from member";
			pstmt=con.prepareStatement(sql);
			//4 실행 => 결과저장
			rs=pstmt.executeQuery();
			//5 결과 행접근 데이터 있으면 MemberDTO 객체생성 set메서드 호출 열접근 해서 값 저장
			//       배열한칸에 저장
			while(rs.next()) {
				MemberDTO mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				//배열한칸에 저장
				memberList.add(mDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberList;
	}

}
