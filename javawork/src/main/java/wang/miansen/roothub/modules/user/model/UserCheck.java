/**  

* @Title: UserCheck.java  

* @Package wang.miansen.roothub.modules.user.model  

* @Description: TODO(用一句话描述该文件做什么)  

* @author 86137  

* @date 2020年1月14日  

* @version V1.0  

*/  
package wang.miansen.roothub.modules.user.model;

/**
 * @author 86137
 *
 */
public class UserCheck {
	private Integer userId;
	private Integer status;	
	private Integer groupId;
	private Integer visitNum;
	@Override
	public String toString() {
		return "UserCheck [userId=" + userId + ", status=" + status + ", groupId=" + groupId + ", visitNum=" + visitNum
				+ "]";
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getVisitNum() {
		return visitNum;
	}
	public void setVisitNum(Integer visitNum) {
		this.visitNum = visitNum;
	}
	
	
	

}
