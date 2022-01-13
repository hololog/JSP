package member;

import java.sql.Timestamp;

public class MemberDTO {

	//멤버변수 => 아무나 접근 못하게 막아줌(접근지정자 private)
	//       => 데이터 은닉
	
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
	// 멤버변수를 접근할수 있는 메서드 정의 (멤버변수에 값을 저장하고 값을 가져오는 작업)
	// set get 메서드 정의 
	// 자동완성 alt shfit s  => r 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}


	
	
	
}
