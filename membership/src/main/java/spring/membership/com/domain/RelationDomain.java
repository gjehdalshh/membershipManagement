package spring.membership.com.domain;

import spring.membership.com.model.RelationEntity;

public class RelationDomain extends RelationEntity{
	private String user_name;
	private String stateMes;
	private int i_user;
	private int friendCount;
	
	
	public int getFriendCount() {
		return friendCount;
	}
	public void setFriendCount(int friendCount) {
		this.friendCount = friendCount;
	}
	public String getStateMes() {
		return stateMes;
	}
	public void setStateMes(String stateMes) {
		this.stateMes = stateMes;
	}
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
	
}
