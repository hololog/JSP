package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class MemberDAO {
	//멤버변수 

	//멤버함수(메서드)
	
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
			 // 1단계 드라이버 불러오기
			 Class.forName("com.mysql.jdbc.Driver");
			 // 2단계 디비연결
			 String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
			 String dbId="root";
			 String dbPass="1234";
			 Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
			 // 3단계 sql 구문 만들기 insert
			 String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
			 PreparedStatement pstmt=con.prepareStatement(sql);
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
			// 예외 상관없이 마무리 작업
		}
		return;
	}//insertMember()메서드
	
	
}//클래스
