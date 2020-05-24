package wang.miansen.roothub.modules.user.service;


import org.apache.ibatis.annotations.Param;

import wang.miansen.roothub.common.beans.Page;
import wang.miansen.roothub.common.dto.UserExecution;
import wang.miansen.roothub.modules.user.model.User;
import wang.miansen.roothub.modules.user.model.UserCheck;


public interface UserCheckService {

	/**
	 * 根据ID查找用户
	 * @param userId
	 * @return
	 */
	UserCheck findById(Integer userId);
	
	Page<UserCheck> page(Integer pageNumber, Integer pageSize);
	
	void updateUserCheck(UserCheck userCheck);

	void deleteUserById(Integer userId);
	
	void createUserCheck(Integer userId, Integer groupId);
	
	void addVisit(Integer userId);
	
//	Page<User> pageForAdmin(String username, String email, Integer pageNumber, Integer pageSize);
	
//	int countAllForAdmin(String username,String email);
//	
//	/**
//	 * 更新用户，主要用于后台操作
//	 * @param user
//	 */
//	void updateAdmin(User user);
	
	/**
	 * 删除用户，主要用于后台操作
	 * @param id
	 */
//	void deleteAdmin(Integer id);
}
