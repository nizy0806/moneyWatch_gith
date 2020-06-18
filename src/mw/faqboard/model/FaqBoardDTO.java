package mw.faqboard.model;

import java.sql.Timestamp;

public class FaqBoardDTO {
	private int faq_num;
	private String writer;
	private String subject;
	private String faq_email;
	private String content;
	private String pw;
	private int readcount;
	private int re_step;
	private int re_level;
	private Timestamp reg;
	
	
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFaq_email() {
		return faq_email;
	}
	public void setFaq_email(String faq_email) {
		this.faq_email = faq_email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
}