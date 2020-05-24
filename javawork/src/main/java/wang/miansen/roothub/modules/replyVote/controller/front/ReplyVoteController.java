package wang.miansen.roothub.modules.replyVote.controller.front;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import wang.miansen.roothub.common.beans.Result;
import wang.miansen.roothub.common.controller.BaseController;
import wang.miansen.roothub.common.util.CookieAndSessionUtil;
import wang.miansen.roothub.modules.reply.service.ReplyService;
import wang.miansen.roothub.modules.replyVote.model.ReplyVote;
import wang.miansen.roothub.modules.replyVote.service.ReplyVoteService;
import wang.miansen.roothub.modules.user.model.User;

@Controller
@RequestMapping("/replyVote")
public class ReplyVoteController extends BaseController {
	@Autowired
	ReplyVoteService replyVoteService;
	@Autowired
	ReplyService replyService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public Result<Map> insert(@RequestParam("tid") Integer tid, @RequestParam("rid") Integer rid,
			@RequestParam("upDown") Boolean upDown, HttpServletRequest request) {
		
		if( getUser(request) == null ){
			return new Result<>(false,null);
		}
		User user = CookieAndSessionUtil.getSession(request, "user");
		ReplyVote reply = null;
		try {
			reply = replyVoteService.selectByRidAndUid(user.getUserId(), rid);
		} catch (Exception e) {
		}
		if (reply == null) {
			reply.setUid(user.getUserId());
			reply.setUpDown(upDown);
			reply.setRid(rid);
			reply.setTid(tid);
			try {
				replyVoteService.insert(reply);
				if(upDown) {
					replyService.updateLikes(1, 0, rid);
				}else {
					replyService.updateLikes(0, 1, rid);
				}
				Map<String,Integer> map=new HashMap<>();
				Integer good=0;
				Integer bad=0;
				try {
					good=replyVoteService.selectUpOrDown(true, rid);
				}catch(Exception e) {
					return new Result(false,"失败");
				}
				try {
					bad=replyVoteService.selectUpOrDown(false, rid);
				}catch(Exception e) {
					return new Result(false,"失败");
				}
				map.put("good", good);
				map.put("bad", bad);
				return new Result<>(true, map);
			} catch (Exception e) {
				return new Result<>(false, e.getMessage());
			}
		} else {
			int one=0,two=0;
			try {
				if(reply.getIsDelete()) {
					if(upDown) {
						one=1;
						two=0;
					}else {
						one=0;
						two=1;
					}
					replyVoteService.updateIsDelete(false, rid, user.getUserId());
					replyVoteService.updateVote(upDown, rid, user.getUserId());
				}else {
					 if(reply.getUpDown()==upDown) {
						 replyVoteService.updateIsDelete(true, rid, user.getUserId());
					 }else {
						 if(upDown) {
							 one=1;
							 two=-1;
						 }else {
							 one=-1;
							 two=1;
						 }
					 replyVoteService.updateVote(upDown, rid, user.getUserId());
					 } 
				}
				if(one!=0&&two!=0) {
					replyService.updateLikes(one, two, rid);
				}
				Map<String,Integer> map=new HashMap<>();
				Integer good=0;
				Integer bad=0;
				try {
					good=replyVoteService.selectUpOrDown(true, rid);
				}catch(Exception e) {
					return new Result(false,"失败");
				}
				try {
					bad=replyVoteService.selectUpOrDown(false, rid);
				}catch(Exception e) {
					return new Result(false,"失败");
				}
				map.put("good", good);
				map.put("bad", bad);
				return new Result<>(true, map);
			}catch(Exception e) {
				return new Result<>(false, e.getMessage());
			}
          
		}
	}
}
