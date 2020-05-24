 package wang.miansen.roothub.modules.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import wang.miansen.roothub.modules.user.model.UserCheck;


public interface UserCheckDao {
	int insertUserCheck(UserCheck usercheck);

	/**
	 * @param userCheck
	 * @return
	 */
	int updateUserCheck(UserCheck userCheck);
	
	/*
	 * 
	 * @Param: id
	 * return UserCheck
	 * */
	UserCheck selectById(@Param("id")Integer id);
	/**
	 * 增加访问量
	 * @param userId
	 * @return
	 */
	int addVisit(@Param("userId")Integer userId);
}