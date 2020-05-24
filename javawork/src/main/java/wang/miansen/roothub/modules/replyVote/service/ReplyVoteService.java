package wang.miansen.roothub.modules.replyVote.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import wang.miansen.roothub.modules.replyVote.model.ReplyVote;

public interface ReplyVoteService {
	/**
	 * @param:要插入信息
	 * @return:
	 * @author:tc.w
	 * @TODO:插入vote
	 **/
	void insert(ReplyVote replyVote);
	/**
	 * @param:更新的数值回复id用户id
	 * @return:
	 * @author:tc.w
	 * @TODO:跟新vote
	 **/
	void updateVote(@Param("choice")Boolean choice,@Param("rid")Integer rid,@Param("uid")Integer uid);
	/**
	 * @param:更新的数值 回答id 用户id
	 * @return:
	 * @author:tc.w
	 * @TODO:更新删除
	 **/
	void updateIsDelete(@Param("choice")Boolean choice,@Param("rid")Integer rid,@Param("uid")Integer uid);
	/**
	 * @param:
	 * @return:所有点赞信息
	 * @author:tc.w
	 * @TODO:查询所有点赞信息
	 **/
	List<ReplyVote> selectAll();
	
	/**
	 * @param:topicid 用户id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询所有用户 在 该帖 点赞 信息
	 **/
	List<ReplyVote> selectByTidAndUid(@Param("tid")Integer tid,@Param("uid")Integer uid);
	/**
	 * @param:用户id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询用户 所有点赞 信息
	 **/
	List<ReplyVote> selectByUid(@Param("uid")Integer uid);
	/**
	 * @param:用户id和回复id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询用户 所有点赞 信息
	 **/
	ReplyVote selectByRidAndUid(@Param("uid")Integer uid,@Param("rid")Integer rid);
	
	Integer selectUpOrDown(@Param("upDown")boolean upDown,@Param("rid")Integer rid);
}
