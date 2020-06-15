package mw.sense.model;

import java.sql.Timestamp;

public class SenseDTO {
	private int num; //번호
	private int main_set; //메인
	private String sense_category; //금융카테고리
	private String sense_title; //제목
	private String sense_content; //내용
	private String sense_url; //URL
	private String sense_thumbnail; //섬네일이미지
	private Timestamp reg_date; //날짠
	
	//setter
	public void setNum(int num) {
		this.num = num;
	}
	public void setMain_set(int main_set) {
		this.main_set = main_set;
	}
	public void setSense_category(String sense_category) {
		this.sense_category = sense_category;
	}
	public void setSense_title(String sense_title) {
		this.sense_title = sense_title;
	}
	public void setSense_content(String sense_content) {
		this.sense_content = sense_content;
	}
	public void setSense_url(String sense_url) {
		this.sense_url = sense_url;
	}
	public void setSense_thumbnail(String sense_thumbnail) {
		this.sense_thumbnail = sense_thumbnail;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	//getter
	public int getNum() {
		return num;
	}
	public int getMain_set() {
		return main_set;
	}
	public String getSense_category() {
		return sense_category;
	}
	public String getSense_title() {
		return sense_title;
	}
	public String getSense_content() {
		return sense_content;
	}
	public String getSense_url() {
		return sense_url;
	}
	public String getSense_thumbnail() {
		return sense_thumbnail;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	
}
