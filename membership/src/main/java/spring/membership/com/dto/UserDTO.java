package spring.membership.com.dto;

import spring.membership.com.model.UserEntity;

public class UserDTO extends UserEntity{
	private String ckPw;
	private String new_pw;
	private String new_chkPw;

	public String getCkPw() {
		return ckPw;
	}

	public void setCkPw(String ckPw) {
		this.ckPw = ckPw;
	}

	public String getNew_pw() {
		return new_pw;
	}

	public void setNew_pw(String new_pw) {
		this.new_pw = new_pw;
	}

	public String getNew_chkPw() {
		return new_chkPw;
	}

	public void setNew_chkPw(String new_chkPw) {
		this.new_chkPw = new_chkPw;
	}
	
}
