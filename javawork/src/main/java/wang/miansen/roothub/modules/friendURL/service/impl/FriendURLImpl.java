/**
 * @Title:friendURLImpl.java
 * @Package:wang.miansen.roothub.modules.friendURL.service.impl
 * @Descripsion:TODO
 * @Author:wtc
 * @Date:2020年1月15日
 */
package wang.miansen.roothub.modules.friendURL.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wang.miansen.roothub.modules.friendURL.dao.FriendURLDao;
import wang.miansen.roothub.modules.friendURL.model.FriendURL;
import wang.miansen.roothub.modules.friendURL.service.FriendURLService;

/**
 * @ClassName:friendURLImpl
 * @Description:TODO
 * @Author:wtc
 * @Date:2020年1月15日
 */
@Service
public class FriendURLImpl implements FriendURLService {
	@Autowired
	private FriendURLDao friendDao;
	/*
	 * 查找所有friend_url并且按照权重排序
	 * @Param
	 * reuturn 所有url
	 * */
	public List<FriendURL> selectAll(){
		List<FriendURL> list=friendDao.selectAll();
		return list;
	}
	
    /*
     * 按照id查找friend_url
     * @Param id
     * return id所对应url
     * */	
	public FriendURL selectById(@Param("id") Integer id) {
		FriendURL url=friendDao.selectById(id);
		return url;
	}
    /*
     * 按照名字查找friend_url
     * @Param name
     * return name对应url
     * */	
	public FriendURL selectByURLName(@Param("name") String name) {
		FriendURL url=friendDao.selectByURLName(name);
		return url;
	}
	
	/*
	 * 添加friend_url
	 * @Param friendURL
	 * return 影响行数
	 * */
	public Integer insert(FriendURL friendURL) {
		Integer re=friendDao.insert(friendURL);
		return re;
	}
	
	/*
	 * 更新friend_url
	 * @Param friendURL
	 * return 行数
	 * */
	public Integer update(FriendURL friendURL) {
		Integer lines=friendDao.updateSelective(friendURL);
		return lines;
	}
	
	/*
	 * 根据id删除friend_url
	 * @Param id
	 * return 影响行数
	 * */
	public Integer deleteById(@Param("id") Integer id) {
		Integer lines=friendDao.deleteById(id);
		return lines;
	}

	@Override
	public List<FriendURL> selectAllTop10() {
		List<FriendURL> list = friendDao.selectAllTop10();
		return list;
	}
}
