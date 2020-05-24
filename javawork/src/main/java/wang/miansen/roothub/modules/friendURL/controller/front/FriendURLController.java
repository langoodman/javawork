/**
 * @Title:FriendURLController.java
 * @Package:wang.miansen.roothub.modules.friendURL
 * @Descripsion:TODO
 * @Author:wtc
 * @Date:2020年1月16日
 */
package wang.miansen.roothub.modules.friendURL.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import wang.miansen.roothub.modules.friendURL.model.FriendURL;
import wang.miansen.roothub.modules.friendURL.service.FriendURLService;
import wang.miansen.roothub.common.beans.*;

/**
 * @ClassName:FriendURLController
 * @Description:TODO
 * @Author:wtc
 * @Date:2020年1月16日
 */
@Controller
public class FriendURLController {
    @Autowired
    private FriendURLService friendURLService;
    
    /**
     * 跳转友情链接页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/morefriendurl", method = RequestMethod.GET)
	private String register(HttpServletRequest request) {
    	List<FriendURL> friendURL = new ArrayList<FriendURL>();
    	try {
    		friendURL = friendURLService.selectAll();
    	} catch (Exception e) {
    		friendURL = new ArrayList<FriendURL>();
    	}
    	if (!friendURL.isEmpty()) {
    		request.setAttribute("friendURL", friendURL);
    	}
    	return "/default/front/friendlist";
    }
	
    /*
     * 跳转
     * @Param 需要跳转页面id
     * return 直接跳转
     * */
    @RequestMapping(value="/friendURL/redirect",method=RequestMethod.POST)
    public void redirectToNewUrl(HttpServletResponse response,@RequestParam("id")Integer id) {
    	FriendURL friend=friendURLService.selectById(id);
    	try {
    		response.sendRedirect(friend.getUrl());
    	}catch(Exception e) {
    	}
    }
    
    /*
     * 插入url
     * @Param 需要插入的url的对象friendURL
     * return 
     * */
    @RequestMapping(value="/friendURL/insert",method=RequestMethod.POST)
    @ResponseBody
    public Result<String> insertURL(@RequestParam("friendURL") FriendURL friendURL){
    	try {
    		Integer lines=friendURLService.insert(friendURL);
    		return new Result<>(true,"成功插入一条URL");
    	}catch(Exception e) {
    		return new Result<>(false,"插入失败");
    	}
    }
    
    /*
     * 更新url
     * @Param 需要更新的url的对象friendURL(除了id之外，其他信息非必须)
     * return
     * */
    @RequestMapping(value="/friendURL/update",method=RequestMethod.POST)
    @ResponseBody
    public Result<String> updateURL(@RequestParam("friendURL") FriendURL friendURL){
    	try {
    		Integer lines=friendURLService.update(friendURL);
    		return new Result<>(true,"更新成功");
    	}catch(Exception e) {
    		return new Result<>(false,"更新失败");
    	}
    }
    
    @RequestMapping(value="/friendURL/delete",method=RequestMethod.POST)
    @ResponseBody
    public Result<String> deleteURL(@RequestParam("id")Integer id){
    	try {
    		Integer lines=friendURLService.deleteById(id);
    		return new Result<>(true,"删除成功");
    	}catch(Exception e) {
    		return new Result<>(false,"删除失败");
    	}
    }
    @RequestMapping(value="/friendURL/list",method=RequestMethod.POST)
    @ResponseBody
    public Result<List<FriendURL>>getAllURL(){
    	try {
    		List<FriendURL> list=friendURLService.selectAll();
    		return new Result<List<FriendURL>>(true,list);
    	}catch(Exception e) {
    		return new Result<>(false,"查询失败");
    	}
    }
    
}
