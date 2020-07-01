package mw.calendar.model;

public class MwScheduleDTO {
	private int num; //번호
	private String id; //회원ID
	private String title; //일정제목
	private String memo; //일정메모
	private String start_time; //시작시간
	private String end_time; //종료시간
	private String place; //장소
	private String sc_color; //색상
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) { 
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public void setSc_color(String sc_color) {
		this.sc_color = sc_color;
	}
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getMemo() {
		return memo;
	}
	public String getStart_time() {
		return start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public String getPlace() {
		return place;
	}
	public String getSc_color() {
		return sc_color;
	}

	
}
