package wang.miansen.roothub.modules.qmxGroup.model;

public class QmxGroup{
	private Integer groupId;
	private String groupName;
	/**
	 * @return the groupId
	 */
	public Integer getGroupId() {
		return groupId;
	}
	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}
	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "qmxGroup [groupId=" + groupId + ", groupName=" + groupName + "]";
	}
	
	
}