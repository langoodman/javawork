package wang.miansen.roothub.modules.replyVote.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wang.miansen.roothub.modules.replyVote.dao.ReplyVoteDao;
import wang.miansen.roothub.modules.replyVote.model.ReplyVote;
import wang.miansen.roothub.modules.replyVote.service.ReplyVoteService;


@Service
public class ReplyVoteServiceImpl implements ReplyVoteService {
	/**
	 * @param:要插入信息
	 * @return:
	 * @author:tc.w
	 * @TODO:插入vote
	 **/
	@Autowired
	ReplyVoteDao replyVoteDao;
 	public void insert(ReplyVote replyVote) {
		replyVoteDao.insert(replyVote);
	}
	/**
	 * @param:更新的数值回复id用户id
	 * @return:
	 * @author:tc.w
	 * @TODO:跟新vote
	 **/
	public void updateVote(@Param("choice")Boolean choice,@Param("rid")Integer rid,@Param("uid")Integer uid) {
		replyVoteDao.updateVote(choice, rid, uid);
	}
	/**
	 * @param:更新的数值 回答id 用户id
	 * @return:
	 * @author:tc.w
	 * @TODO:更新删除
	 **/
	public void updateIsDelete(@Param("choice")Boolean choice,@Param("rid")Integer rid,@Param("uid")Integer uid) {
		replyVoteDao.updateIsDelete(choice, rid, uid);
	}
	/**
	 * @param:
	 * @return:所有点赞信息
	 * @author:tc.w
	 * @TODO:查询所有点赞信息
	 **/
	public List<ReplyVote> selectAll(){
		return replyVoteDao.selectAll();
	}
	
	/**
	 * @param:topicid 用户id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询所有用户 在 该帖 点赞 信息
	 **/
	public List<ReplyVote> selectByTidAndUid(@Param("tid")Integer tid,@Param("uid")Integer uid){
		return replyVoteDao.selectByTidAndUid(tid, uid);
	}
	/**
	 * @param:用户id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询用户 所有点赞 信息
	 **/
	public List<ReplyVote> selectByUid(@Param("uid")Integer uid){
		return replyVoteDao.selectByUid(uid);				
	}
	/**
	 * @param:用户id和回复id
	 * @return:list
	 * @author:tc.w
	 * @TODO:查询用户 所有点赞 信息
	 **/
	public ReplyVote selectByRidAndUid(@Param("uid")Integer uid,@Param("rid")Integer rid) {
		return replyVoteDao.selectByRidAndUid(uid, rid);
	}
	
	public Integer selectUpOrDown(@Param("upDown")boolean upDown,@Param("rid")Integer rid) {
		return replyVoteDao.selectUpOrDown(upDown, rid);
	}
}
