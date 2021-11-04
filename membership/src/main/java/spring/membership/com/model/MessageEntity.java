package spring.membership.com.model;

public class MessageEntity {
	private int i_message;
	private int i_user;
	private int i_channel;
	private String msg;
	private String r_dt;
	private String m_dt;
	public int getI_message() {
		return i_message;
	}
	public void setI_message(int i_message) {
		this.i_message = i_message;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getI_channel() {
		return i_channel;
	}
	public void setI_channel(int i_channel) {
		this.i_channel = i_channel;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	
	
}
