package wang.miansen.roothub.modules.feedback.model;

import java.sql.Date;

public class Feedback {
	/**
	 * 唯一标识
	 */
	private int id;
	/**
	 * 用户ID
	 */
	private int uid;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 创建时间
	 */
	private Date time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
