package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//멤버변수
		private Connection con=null;
		private PreparedStatement pstmt=null;
		private ResultSet rs=null;
		
		//db연결
		public Connection getConnection() throws Exception{
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
		
		//객체마무리
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
		
	
	// 리턴할형 List  getBoardList(int startRow, int pageSize) 메서드 정의
		
	
}//클래스

