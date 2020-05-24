/**
 * @Title:FriendURLService.java
 * @Package:wang.miansen.roothub.modules.friendURL.service
 * @Descripsion:TODO
 * @Author:wtc
 * @Date:2020年1月15日
 */
package wang.miansen.roothub.modules.friendURL.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import wang.miansen.roothub.modules.friendURL.model.FriendURL;

/**
 * @ClassName:FriendURLService
 * @Description:TODO
 * @Author:wtc
 * @Date:2020年1月15日
 */

public interface FriendURLService {
	/*
	 * 查找所有friend_url并且按照权重排序
	 * @Param
	 * reuturn 所有url
	 * */
	List<FriendURL> selectAll();
	/*
	 * 查找前10条friend_url并且按照权重排序
	 * @Param
	 * reuturn 前10条url
	 * */
	List<FriendURL> selectAllTop10();
    /*
     * 按照id查找friend_url
     * @Param id
     * return id所对应url
     * */	
	FriendURL selectById(@RequestParam("id") Integer id);
    /*
     * 按照名字查找friend_url
     * @Param name
     * return name对应url
     * */	
	FriendURL selectByURLName(@RequestParam("name") String name);
	
	/*
	 * 添加friend_url
	 * @Param friendURL
	 * return 影响行数
	 * */
	Integer insert(FriendURL friendURL);
	
	/*
	 * 更新friend_url
	 * @Param friendURL
	 * return 行数
	 * */
	Integer update(FriendURL friendURL);
	
	/*
	 * 根据id删除friend_url
	 * @Param id
	 * return 影响行数
	 * */
	Integer deleteById(@Param("id") Integer id);
}
