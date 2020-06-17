package mw.fnaboard.model;

import java.sql.Timestamp;

public class FnaBoardDTO {
	private int fna_num;
	private String writer;
	private String subject;
	private String fna_email;
	private String content;
	private String pw;
	private int readcount;
	private String ip;
	private int re_step;
	private int re_level;
	private Timestamp reg;
	
	

	public int getFna_num() {
		return fna_num;
	}
	public void setFna_num(int fna_num) {
		this.fna_num = fna_num;
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
	public String getFna_email() {
		return fna_email;
	}
	public void setFna_email(String fna_email) {
		this.fna_email = fna_email;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
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