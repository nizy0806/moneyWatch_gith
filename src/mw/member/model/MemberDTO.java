package mw.member.model;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String id;		// 회원ID
	private String pw;		// 회원PW
	private String name;	// 이름
	private String gender;	// 성별
	private String birth_y;	// 생년월일(연도)
	private String birth_m;	// 생년월일(월)
	private String birth_d;	// 생년월일(일)
	private String tel;		// 휴대폰 통신사(SKT,KT,LGU,etc(알뜰폰))
	private String phone1;	// 휴대폰 앞자리(010,011,...)
	private String phone2;	// 휴대폰 중간자리
	private String phone3;	// 휴대폰 뒷자리
	private String zon;		// 우편번호
	private String street;	// 주소
	private String addr;	// 상세주소
	private String email1;	// 이메일ID
	private String email2;	// 이메일주소
	private Timestamp reg;	// 가입날짜및시간

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id=id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth_y() {
		return birth_y;
	}
	public void setBirth_y(String birth_y) {
		this.birth_y = birth_y;
	}
	public String getBirth_m() {
		return birth_m;
	}
	public void setBirth_m(String birth_m) {
		this.birth_m = birth_m;
	}
	public String getBirth_d() {
		return birth_d;
	}
	public void setBirth_d(String birth_d) {
		this.birth_d = birth_d;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getZon() {
		return zon;
	}
	public void setZon(String zon) {
		this.zon = zon;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

}
