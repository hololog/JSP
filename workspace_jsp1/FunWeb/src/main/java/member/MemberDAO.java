package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//멤버변수 
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	//데이터 베이스 연결 메서드 정의 
	// throws Exception 메서드 호출하는 곳에서 예외처리 함
	public Connection getConnection() throws Exception{
		 // 1단계 드라이버 불러오기
		 Class.forName("com.mysql.jdbc.Driver");
		 // 2단계 디비연결
		 String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
		 String dbId="root";
		 String dbPass="1234";
		 con=DriverManager.getConnection(dbUrl, dbId, dbPass);	
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
	
	// 리턴할형없음 insertMember(MemberDTO mDTO) 메서드 정의 
	public void insertMember(MemberDTO mDTO) {
//		System.out.println("메서드시작");
		try {
//			int a=10;
//			int b=0;
//			System.out.println(a/b); //에러발생
			
			// 예외가 발생할 가능성이 높은 코드 
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			 con=getConnection();
			 
			 // 3단계 sql 구문 만들기 insert
			 String sql="insert into member(id,pass,name,date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mDTO.getId());
			 pstmt.setString(2, mDTO.getPass());
			 pstmt.setString(3, mDTO.getName());
			 pstmt.setTimestamp(4, mDTO.getDate());
			 pstmt.setString(5, mDTO.getEmail());
			 pstmt.setString(6, mDTO.getAddress());
			 pstmt.setString(7, mDTO.getPhone());
			 pstmt.setString(8, mDTO.getMobile());
			 // 4단계 실행
			 pstmt.executeUpdate();
			
		} catch (Exception e) {
//			System.out.println("에러처리");
			e.printStackTrace();
		}finally {
			//마무리
//			System.out.println("마무리");
			dbClose();
		}
//		System.out.println("메서드끝");
	}
	
	
}//클래스
