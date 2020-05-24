package wang.miansen.roothub.modules.replyVote.model;

import java.sql.Date;

public class ReplyVote {
private Integer id;
private Integer uid;
private Integer rid;
private Integer tid;
private Boolean upDown;
private Date time;
private Boolean isDelete;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getUid() {
	return uid;
}
public void setUid(Integer uid) {
	this.uid = uid;
}
public Integer getRid() {
	return rid;
}
public void setRid(Integer rid) {
	this.rid = rid;
}
public Integer getTid() {
	return tid;
}
public void setTid(Integer tid) {
	this.tid = tid;
}
public Boolean getUpDown() {
	return upDown;
}
public void setUpDown(Boolean upDown) {
	this.upDown = upDown;
}
public Date getTime() {
	return time;
}
public void setTime(Date time) {
	this.time = time;
}
public Boolean getIsDelete() {
	return isDelete;
}
public void setIsDelete(Boolean isDelete) {
	this.isDelete = isDelete;
}

}
