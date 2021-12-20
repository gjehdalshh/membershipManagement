package spring.membership.com.dto;

import spring.membership.com.model.RelationEntity;

public class RelationDTO extends RelationEntity{
	private String user_name;
	private String quotes;
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
