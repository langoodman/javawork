package wang.miansen.roothub.modules.user.service.impl;

import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import wang.miansen.roothub.third.service.RedisService;
import wang.miansen.roothub.common.util.StringUtils;
import wang.miansen.roothub.modules.user.model.User;
import wang.miansen.roothub.modules.user.model.UserCheck;
import wang.miansen.roothub.modules.user.service.UserCheckService;
import wang.miansen.roothub.modules.user.service.UserService;
import wang.miansen.roothub.store.StorageService;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wang.miansen.roothub.modules.user.dao.UserCheckDao;
import wang.miansen.roothub.modules.user.dao.UserDao;
import wang.miansen.roothub.common.beans.Page;
import wang.miansen.roothub.common.dto.UserExecution;
import wang.miansen.roothub.modules.integral.model.Top100;
import wang.miansen.roothub.common.enums.InsertUserEnum;
import wang.miansen.roothub.common.enums.UpdateUserEnum;
import wang.miansen.roothub.common.exception.OperationFailedException;
import wang.miansen.roothub.common.exception.OperationRepeaException;
import wang.miansen.roothub.common.exception.OperationSystemException;
import wang.miansen.roothub.modules.collect.service.CollectService;
import wang.miansen.roothub.modules.notice.service.NoticeService;
import wang.miansen.roothub.modules.reply.service.ReplyService;
import wang.miansen.roothub.modules.topic.service.TopicService;
import wang.miansen.roothub.common.util.CookieAndSessionUtil;
import wang.miansen.roothub.common.util.JsonUtil;
import wang.miansen.roothub.common.util.bcrypt.BCryptPasswordEncoder;

@Service
public class UserCheckServiceImpl implements UserCheckService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserDao rootUserDao;
	
	@Autowired
	private UserCheckDao userCheckDao;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private CollectService collectService;
	
	@Autowired
	private NoticeService noticeService;

	@Autowired
	private RedisService redisService;
	
	@Override
	public UserCheck findById(Integer id) {
		// TODO Auto-generated method stub
	    return userCheckDao.selectById(id);
	}
	@Transactional
	@Override
	public void updateUserCheck(UserCheck userCheck) {
		int updateUserCheck = userCheckDao.updateUserCheck(userCheck);
		User rootUser = rootUserDao.selectByUserId(userCheck.getUserId());
		if(updateUserCheck <= 0) {
			throw new OperationFailedException("修改失败");
		}else {
			redisService.setString(rootUser.getThirdAccessToken(), JsonUtil.objectToJson(rootUser));
			}
	}

	@Override
	public void deleteUserById(Integer userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createUserCheck(Integer userId, Integer groupId) {
		UserCheck userCheck = new UserCheck();
		userCheck.setUserId(userId);
		userCheck.setStatus(0);
		userCheck.setVisitNum(0);
		userCheck.setGroupId(groupId);
		userCheckDao.insertUserCheck(userCheck);
		// TODO Auto-generated method stub
		
	}

	@Override
	public Page<UserCheck> page(Integer pageNumber, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void addVisit(Integer userId) {
		userCheckDao.addVisit(userId);
	}
	
}