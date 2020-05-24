package wang.miansen.roothub.modules.feedback.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import wang.miansen.roothub.modules.feedback.model.Feedback;

public interface FeedbackDao {
	/*
	 * @param:
	 * return:装有全部feedback的list 
	 * todo:查询所有反馈信息
	 * */
	List<Feedback> selectAll();
	/*
	 * @param:id
	 * return:影响行数
	 * todo:根据id删除反馈信息
	 * */
	Integer deleteById(@Param("id") int id);
	/*
	 * @param:uid
	 * return:影响行数
	 * todo:根据用户id删除反馈信息
	 * */
	Integer deleteByUid(@Param("uid") int uid);
	/*
	 * @param:feedback
	 * return:影响行数
	 * todo:添加的信息
	 * */
	Integer insert(Feedback feedback);
	/*
	 * @param:
	 * return:
	 * todo:删除所有反馈信息
	 * */
	void truncateTable();
}
