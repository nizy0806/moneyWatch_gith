package mw.account_card.model;

public class CardDTO {

	private int num;
	private int img_cnt;
	private String card_name;
	private String all_benefit_name;
	private String benefit_text_all;
	private String company;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getImg_cnt() {
		return img_cnt;
	}
	public void setImg_cnt(int img_cnt) {
		this.img_cnt = img_cnt;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getAll_benefit_name() {
		return all_benefit_name;
	}
	public void setAll_benefit_name(String all_benefit_name) {
		this.all_benefit_name = all_benefit_name;
	}
	public String getBenefit_text_all() {
		return benefit_text_all;
	}
	public void setBenefit_text_all(String benefit_text_all) {
		this.benefit_text_all = benefit_text_all;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	
}
