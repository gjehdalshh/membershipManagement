package spring.membership.com.dto;

import spring.membership.com.model.UserEntity;

public class UserDTO extends UserEntity{
	private String ckPw;

	public String getCkPw() {
		return ckPw;
	}

	public void setCkPw(String ckPw) {
		this.ckPw = ckPw;
	}
	
}
