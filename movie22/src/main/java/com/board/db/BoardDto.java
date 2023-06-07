package com.board.db;

public class BoardDto {
	
	private int review_star;
	private int member_Num;
	private String review_content = "";
	private String review_time ="";
	private String review_content_id ="";
	private String member_nick ="";
	private String poster_path ="";
	private String type = "";
	private String data_id = "";
	private String member_id = "";
	private String mark_time = "";
	private int shareParty_num ;
	private int ott_price ;
	private int shareParty_gauge ;
	private String ott_name = "";
	private String ott_id ="";
	private String ott_pw ="";
	private String mem_num ="";
	private int money;
	

	
	

	


	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}
	public String getOtt_id() {
		return ott_id;
	}
	public void setOtt_id(String ott_id) {
		this.ott_id = ott_id;
	}
	public String getOtt_pw() {
		return ott_pw;
	}
	public void setOtt_pw(String ott_pw) {
		this.ott_pw = ott_pw;
	}
	public int getOtt_price() {
		return ott_price;
	}
	public void setOtt_price(int ott_price) {
		this.ott_price = ott_price;
	}
	public int getShareParty_gauge() {
		return shareParty_gauge;
	}
	public void setShareParty_gauge(int shareParty_gauge) {
		this.shareParty_gauge = shareParty_gauge;
	}
	public String getOtt_name() {
		return ott_name;
	}
	public void setOtt_name(String ott_name) {
		this.ott_name = ott_name;
	}
	public int getShareParty_num() {
		return shareParty_num;
	}
	public void setShareParty_num(int shareParty_num) {
		this.shareParty_num = shareParty_num;
	}
	public String getPoster_path() {
		return poster_path;
	}
	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getData_id() {
		return data_id;
	}
	public void setData_id(String data_id) {
		this.data_id = data_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMark_time() {
		return mark_time;
	}
	public void setMark_time(String mark_time) {
		this.mark_time = mark_time;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public int getMember_Num() {
		return member_Num;
	}
	public void setMember_Num(int member_Num) {
		this.member_Num = member_Num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_time() {
		return review_time;
	}
	public void setReview_time(String review_time) {
		this.review_time = review_time;
	}
	public String getReview_content_id() {
		return review_content_id;
	}
	public void setReview_content_id(String review_content_id) {
		this.review_content_id = review_content_id;
	}
	
}
