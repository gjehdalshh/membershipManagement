package spring.membership.com.domain;

import spring.membership.com.model.RelationEntity;

public class RelationDomain extends RelationEntity{
	private String user_name;
	private String quotes;
	private int i_user;
	
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getQuotes() {
		return quotes;
	}
	public void setQuotes(String quotes) {
		this.quotes = quotes;
	}
}
