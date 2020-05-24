package wang.miansen.roothub.modules.reply.model;

import java.util.Date;

import lombok.Data;

/**
 * 评论实体
 * Table: root_reply
 * @author sen
 * 2018年5月5日
 * 下午9:30:23
 * TODO
 */
/**
 * @author 86137
 *
 */
@Data
public class Reply {

	/**
	 * 回复标识
	 */
	private Integer replyId;
	
	/**
	 * 话题id
	 */
	private Integer topicId;
	
	/**
	 * 话题作者id
	 */
	private Integer topicAuthorId;
	
	/**
	 * 回复内容
	 */
	private String replyContent;
	
	/**
	 * 回复时间
	 */
	private Date createDate;
	
	/**
	 * 更新时间
	 */
	private Date updateDate;
	
	/**
	 * 当前回复用户id
	 */
	private Integer replyAuthorId;
	
	/**
	 * 当前回复用户昵称
	 */
	private String replyAuthorName;
	
	/**
	 * 是否删除 0:默认 1:删除 2:其他
	 */
	private Boolean isDelete;
	
	/**
	 * 是否已读 0:已读 1:未读 2:其他
	 */
	private Boolean isRead;
	
	/**
	 * 是否可见 0:可见 1:不可见 2:其他
	 */
	private Boolean isShow;
	
	/**
	 * 点赞
	 */
	private Integer replyGoodCount;
	
	/**
	 * 踩数
	 */
	private Integer replyBadCount;
	
	/**
	 * 回复类型
	 */
	private String replyType;
	
	/**
	 * 回复阅读数量
	 */
	private Integer replyReadCount;
	
	/**
	 * 回复状态 1000:有效 1100:无效 1200:未生效
	 */
	private String statusCd;
	
	/**
	 * 回复人的头像
	 */
	private String avatar;
	
	
	/*
	 * 等级
	 * */
	private Integer rank;
	
	
	/*
	 * 评论总数、
	 * 
	 * */
	private Integer total;
	
	/*
	 * 评论id
	 * */
	private Integer commentId;

	/**
	 * @return the replyId
	 */
	public Integer getReplyId() {
		return replyId;
	}

	/**
	 * @param replyId the replyId to set
	 */
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	/**
	 * @return the topicId
	 */
	public Integer getTopicId() {
		return topicId;
	}

	/**
	 * @param topicId the topicId to set
	 */
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	/**
	 * @return the topicAuthorId
	 */
	public Integer getTopicAuthorId() {
		return topicAuthorId;
	}

	/**
	 * @param topicAuthorId the topicAuthorId to set
	 */
	public void setTopicAuthorId(Integer topicAuthorId) {
		this.topicAuthorId = topicAuthorId;
	}

	/**
	 * @return the replyContent
	 */
	public String getReplyContent() {
		return replyContent;
	}

	/**
	 * @param replyContent the replyContent to set
	 */
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return the updateDate
	 */
	public Date getUpdateDate() {
		return updateDate;
	}

	/**
	 * @param updateDate the updateDate to set
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	/**
	 * @return the replyAuthorId
	 */
	public Integer getReplyAuthorId() {
		return replyAuthorId;
	}

	/**
	 * @param replyAuthorId the replyAuthorId to set
	 */
	public void setReplyAuthorId(Integer replyAuthorId) {
		this.replyAuthorId = replyAuthorId;
	}

	/**
	 * @return the replyAuthorName
	 */
	public String getReplyAuthorName() {
		return replyAuthorName;
	}

	/**
	 * @param replyAuthorName the replyAuthorName to set
	 */
	public void setReplyAuthorName(String replyAuthorName) {
		this.replyAuthorName = replyAuthorName;
	}

	/**
	 * @return the isDelete
	 */
	public Boolean getIsDelete() {
		return isDelete;
	}

	/**
	 * @param isDelete the isDelete to set
	 */
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	/**
	 * @return the isRead
	 */
	public Boolean getIsRead() {
		return isRead;
	}

	/**
	 * @param isRead the isRead to set
	 */
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	/**
	 * @return the isShow
	 */
	public Boolean getIsShow() {
		return isShow;
	}

	/**
	 * @param isShow the isShow to set
	 */
	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	/**
	 * @return the replyGoodCount
	 */
	public Integer getReplyGoodCount() {
		return replyGoodCount;
	}

	/**
	 * @param replyGoodCount the replyGoodCount to set
	 */
	public void setReplyGoodCount(Integer replyGoodCount) {
		this.replyGoodCount = replyGoodCount;
	}

	/**
	 * @return the replyBadCount
	 */
	public Integer getReplyBadCount() {
		return replyBadCount;
	}

	/**
	 * @param replyBadCount the replyBadCount to set
	 */
	public void setReplyBadCount(Integer replyBadCount) {
		this.replyBadCount = replyBadCount;
	}

	/**
	 * @return the replyType
	 */
	public String getReplyType() {
		return replyType;
	}

	/**
	 * @param replyType the replyType to set
	 */
	public void setReplyType(String replyType) {
		this.replyType = replyType;
	}

	/**
	 * @return the replyReadCount
	 */
	public Integer getReplyReadCount() {
		return replyReadCount;
	}

	/**
	 * @param replyReadCount the replyReadCount to set
	 */
	public void setReplyReadCount(Integer replyReadCount) {
		this.replyReadCount = replyReadCount;
	}

	/**
	 * @return the statusCd
	 */
	public String getStatusCd() {
		return statusCd;
	}

	/**
	 * @param statusCd the statusCd to set
	 */
	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
	}

	/**
	 * @return the avatar
	 */
	public String getAvatar() {
		return avatar;
	}

	/**
	 * @param avatar the avatar to set
	 */
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	/**
	 * @return the rank
	 */
	public Integer getRank() {
		return rank;
	}

	/**
	 * @param rank the rank to set
	 */
	public void setRank(Integer rank) {
		this.rank = rank;
	}

	/**
	 * @return the total
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * @return the commentId
	 */
	public Integer getCommentId() {
		return commentId;
	}

	/**
	 * @param commentId the commentId to set
	 */
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	
    
	
}
