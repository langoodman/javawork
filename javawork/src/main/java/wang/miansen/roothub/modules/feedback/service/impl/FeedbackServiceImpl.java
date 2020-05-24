package wang.miansen.roothub.modules.feedback.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wang.miansen.roothub.modules.feedback.dao.FeedbackDao;
import wang.miansen.roothub.modules.feedback.model.Feedback;
import wang.miansen.roothub.modules.feedback.service.FeedbackService;


@Service
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	private FeedbackDao feedbackDao;
	
	/*
	 * @param:
	 * return:装有全部feedback的list 
	 * todo:查询所有反馈信息
	 * */
	public List<Feedback> selectAll(){
		List<Feedback> list=feedbackDao.selectAll();
		return list;
	}
	/*
	 * @param:id
	 * return:影响行数
	 * todo:根据id删除反馈信息
	 * */
	public Integer deleteById(@Param("id") int id) {
		return feedbackDao.deleteById(id);
	}
	/*
	 * @param:uid
	 * return:影响行数
	 * todo:根据用户id删除反馈信息
	 * */
	 public Integer deleteByUid(@Param("uid") int uid) {
		return feedbackDao.deleteByUid(uid);
	}
	/*
	 * @param:feedback
	 * return:影响行数
	 * todo:添加的信息
	 * */
	public Integer insert(Feedback feedback) {
		return feedbackDao.insert(feedback);
	}
	/*
	 * @param:
	 * return:
	 * todo:删除所有反馈信息
	 * */
	public void truncateTable() {
		feedbackDao.truncateTable();
	}
}
