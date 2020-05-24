package wang.miansen.roothub.modules.user.controller.front;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wang.miansen.roothub.common.beans.BaseEntity;
import wang.miansen.roothub.common.beans.Page;
import wang.miansen.roothub.common.beans.Result;
import wang.miansen.roothub.common.controller.BaseController;
import wang.miansen.roothub.modules.reply.service.ReplyService;
import wang.miansen.roothub.modules.user.model.User;
import wang.miansen.roothub.modules.user.model.UserCheck;
import wang.miansen.roothub.modules.user.service.UserCheckService;
import wang.miansen.roothub.modules.user.service.UserService;
import wang.miansen.roothub.modules.visit.model.Visit;
import wang.miansen.roothub.store.StorageService;

import org.h2.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hutool.core.codec.Base64;
import wang.miansen.roothub.common.dto.UserExecution;
import wang.miansen.roothub.modules.reply.model.ReplyAndTopicByName;
import wang.miansen.roothub.modules.topic.model.Topic;
import wang.miansen.roothub.modules.collect.service.CollectService;
import wang.miansen.roothub.modules.feedback.model.Feedback;
import wang.miansen.roothub.modules.notice.model.Notice;
import wang.miansen.roothub.modules.notice.service.NoticeService;
import wang.miansen.roothub.modules.qmxGroup.model.QmxGroup;
import wang.miansen.roothub.modules.qmxGroup.service.qmxGroupService;
import wang.miansen.roothub.modules.topic.service.TopicService;
import wang.miansen.roothub.modules.visit.service.VisitService;
import wang.miansen.roothub.common.util.ApiAssert;
import wang.miansen.roothub.common.util.Base64Util;
import wang.miansen.roothub.common.util.CookieAndSessionUtil;
import wang.miansen.roothub.common.util.bcrypt.BCryptPasswordEncoder;

@Controller
public class UserController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ReplyService rootReplyService;
	@Autowired
	private UserService rootUserService;
	@Autowired
	private TopicService rootTopicService;
	@Autowired
	private CollectService collectDaoService;
	@Autowired
	private NoticeService rootNoticeService;
	@Autowired
	private VisitService visitService;
	@Autowired
	private StorageService storageService;
	@Autowired
	private UserCheckService userCheckService;
	@Autowired
	private qmxGroupService groupService;
	@Autowired
    private NoticeService noticeService;

	/**
	 * 用户主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/{name}", method = RequestMethod.GET)
	private String detail(@PathVariable String name, Model model,
			@RequestParam(value = "tp", defaultValue = "1") Integer tp,
			@RequestParam(value = "rp", defaultValue = "1") Integer rp, HttpServletRequest request) {
		if (name == null) {
			return "/default/front/error/404";
		}
		User user = null;
		try {
			user = rootUserService.findByName(name);
		} catch (Exception e) {
			if (user == null) {
				return "/default/front/error/404";
			}
		}
		User user2 = getUser(request);// 当前用户
		Page<Topic> topicPage = rootTopicService.pageByAuthor(tp, 20, name);
		Page<ReplyAndTopicByName> replyPage = rootReplyService.findAllByNameAndTopic(name, rp, 20);
		int countTopic = rootTopicService.countByUserName(user.getUserName());// 主题数量
		int countCollect = collectDaoService.count(user.getUserId());// 用户收藏话题的数量
		int countReply = rootReplyService.countByName(name);// 评论的数量
		int countScore = rootUserService.countScore(user.getUserId());// 积分
		int countVisit = visitService.count(user.getUserId());// 被访问的次数
		// 当用户为登录状态并且访问者与被访问者不是同一个人时，添加访问记录
		if (user2 != null && user.getUserId() != user2.getUserId()) {
			Visit visit = new Visit();
			visit.setUid(user2.getUserId());
			visit.setVid(user.getUserId());
			visit.setCreateDate(new Date());
			visit.setDelete(false);
			visitService.save(visit);
			
			userCheckService.addVisit(user.getUserId());
			Notice notice = new Notice();
			notice.setNoticeTitle("visitNotice");//通知标题
            notice.setIsRead(false);//是否已读：0:默认 1:已读
            notice.setNoticeAuthorId(user2.getUserId());//发起通知用户ID
            notice.setNoticeAuthorName(user2.getUserName());//发起通知用户昵称
            notice.setTargetAuthorName(user.getUserName());//要通知用户的昵称
            notice.setCreateDate(new Date());//创建时间
            notice.setUpdateDate(new Date());//更新时间
            notice.setNoticeAction("visit");//通知动作
            notice.setTopicId(0);//话题ID
//            notice.setNoticeContent(content);//通知内容
            notice.setStatusCd("1000");//通知状态 1000:有效 1100:无效 1200:未生效
            noticeService.save(notice);//添加通知
		}
		UserCheck userCheck = userCheckService.findById(user.getUserId());
		List<QmxGroup> groupList = groupService.findAll();
		model.addAttribute("userCheck", userCheck);
		model.addAttribute("groupList", groupList);
		model.addAttribute("user", user);
		model.addAttribute("user2", user2);
		model.addAttribute("replyPage", replyPage);
		model.addAttribute("topicPage", topicPage);
		model.addAttribute("countTopic", countTopic);
		model.addAttribute("countCollect", countCollect);
		model.addAttribute("countReply", countReply);
		model.addAttribute("countScore", countScore);
		model.addAttribute("countVisit", countVisit);
		return "/default/front/user/view";
	}

	/**
	 * 查看用户创建的更多话题
	 * 
	 * @param model
	 * @param p
	 * @return
	 */
	@RequestMapping(value = "/user/topics", method = RequestMethod.GET)
	private String topics(Model model, @RequestParam(value = "p", defaultValue = "1") Integer p,
			HttpServletRequest request) {
		User user2 = getUser(request);// 当前用户
		if (user2 == null)
			return "/default/front/error/404";
		Page<Topic> topicPage = rootTopicService.pageByAuthor(p, 50, user2.getUserName());
		int countCollect = collectDaoService.count(user2.getUserId());// 用户收藏话题的数量
		int countTopicByUserName = rootTopicService.countByUserName(user2.getUserName());// 用户发布的主题的数量
		int notReadNotice = rootNoticeService.countNotReadNotice(user2.getUserName());// 未读通知的数量
		BaseEntity baseEntity = new BaseEntity();
		model.addAttribute("baseEntity", baseEntity);
		model.addAttribute("user", user2);
		model.addAttribute("topicPage", topicPage);
		request.setAttribute("countCollect", countCollect);
		request.setAttribute("countTopicByUserName", countTopicByUserName);
		request.setAttribute("notReadNotice", notReadNotice);
		return "/default/front/user/topics";
	}

	/**
	 * 查看用户评论的更多话题
	 * 
	 * @param name
	 * @param model
	 * @param p
	 * @return
	 */
	@RequestMapping(value = "/user/{name}/replys", method = RequestMethod.GET)
	private String replys(@PathVariable String name, Model model,
			@RequestParam(value = "p", defaultValue = "1") Integer p, HttpServletRequest request) {
		if (name == null) {
			return "/default/front/error/404";
		}
		User user = null;
		user = rootUserService.findByName(name);
		if (user == null) {
			return "/default/front/error/404";
		}
		User user2 = getUser(request);// 当前用户
		Page<ReplyAndTopicByName> replyPage = rootReplyService.findAllByNameAndTopic(name, p, 20);
		int countTopic = rootTopicService.countByUserName(user.getUserName());// 主题数量
		int countCollect = collectDaoService.count(user.getUserId());// 用户收藏话题的数量
		int countReply = rootReplyService.countByName(user.getUserName());// 评论的数量
		model.addAttribute("user", user);
		model.addAttribute("user2", user2);
		model.addAttribute("replyPage", replyPage);
		model.addAttribute("countTopic", countTopic);
		model.addAttribute("countCollect", countCollect);
		model.addAttribute("countReply", countReply);
		// model.addAttribute("countCollect", getCountCollect(request));
		// model.addAttribute("countTopicByUserName", getCountTopicByUserName(request));
		// model.addAttribute("notReadNotice", getNotReadNotice(request));
		// model.addAttribute("myUser", getUser(request));
		return "/default/front/user/replys";
	}

	/**
	 * 进入个人设置页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/settings/profile", method = RequestMethod.GET)
	private String setting(HttpServletRequest request) {
		User user = null;
		String cookie = CookieAndSessionUtil.getCookie(request, "user");
		if (StringUtils.isNullOrEmpty(cookie)) {
			user = getUser(request);
		} else {
			try {
				user = rootUserService.selectByThirdToken(Base64Util.decode(cookie));
				System.out.println(user);
			} catch (Exception e) {
				user = null;
			}
		}

		if (user == null) {
			return "/default/front/error/error";
		} else {
			System.out.println(user);
		}
		request.setAttribute("user", user);
		return "/default/front/user/profile";

	}

	/**
	 * 修改个人设置
	 * 
	 * @param email
	 * @param url
	 * @param thirdId
	 * @param userAddr
	 * @param signature
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/setting/profile", method = RequestMethod.POST)
	private String updateUserInfo(String email, String url, String thirdId, String userAddr, String signature,
			HttpServletRequest request, HttpServletResponse response) {
		User user = null;
		try {
			String cookie = CookieAndSessionUtil.getCookie(request, "user");
			user = rootUserService.selectByThirdToken(Base64Util.decode(cookie));
		} catch (Exception e) {
			user = CookieAndSessionUtil.getSession(request, "user");
		}
		if (user != null) {
			user.setEmail(email);
			user.setUrl(url);
			user.setThirdId(thirdId);
			user.setUserAddr(userAddr);
			user.setSignature(signature);
			rootUserService.updateUser(user);
			CookieAndSessionUtil.removeSession(request, "user");
			CookieAndSessionUtil.setSession(request, "user",user);
			try {
				response.sendRedirect("/user/settings/profile");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "/default/front/error/error";
	}

	/**
	 * 进入修改头像界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/settings/changeAvatar", method = RequestMethod.GET)
	private String changeAvatar(HttpServletRequest request) {
		String cookie = CookieAndSessionUtil.getCookie(request, "user");
		User user = null;
		if (cookie == null) {
			user = getUser(request);
		} else {
			user = rootUserService.selectByThirdToken(Base64Util.decode(cookie));
		}
		if (user == null) {
			return "/default/front/error/error";
		}
		return "/default/front/user/changeAvatar";
	}

	/**
	 * 更新头像
	 * 
	 * @param avatarBase64:base64格式的图片
	 * @param path:自定义保存路径
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/setting/changeAvatar", method = RequestMethod.POST)
	@ResponseBody
	private Result<String> changeAvatar(String avatarBase64, String path, HttpServletRequest request) {
		User user = getUser(request);
		ApiAssert.notNull(user, "请先登录");
		ApiAssert.notEmpty(avatarBase64, "头像不能为空");
		rootUserService.updateAvatar(avatarBase64, path, user, request);
		return new Result(true, "更新成功");
	}

	/**
	 * 进入修改密码界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/settings/changePassword", method = RequestMethod.GET)
	private String changePassword(HttpServletRequest request) {
		return isLogin(request, "/default/front/error/error", "/default/front/user/changePassword");
	}

	@RequestMapping(value = "/user/setting/changePassword", method = RequestMethod.POST)
	@ResponseBody
	private Result<UserExecution> changePassword(HttpServletRequest request, String oldPassword, String newPassword) {
		if (newPassword == null) {
			return new Result<>(false, "密码不能为空");
		}
		User user = getUser(request);
		boolean flag = new BCryptPasswordEncoder().matches(oldPassword,user.getPassword());
		if (!flag) {
			return new Result<>(false, "旧密码不正确");
		}
		// 加密保存
		user.setPassword(new BCryptPasswordEncoder().encode(newPassword));
		UserExecution updateUser = rootUserService.updateUser(user);
		return new Result<UserExecution>(true, updateUser);
	}
	
	/**
	 * 选组别
	 * 
	 * @param request
	 * @param p
	 * @return
	 */
	@RequestMapping(value = "/user/setting/applyGroup", method = RequestMethod.POST)
	@ResponseBody
	private Result<UserCheck> checkStatus(@RequestParam("groupId") Integer groupId,
			HttpServletRequest request, HttpServletResponse response) {
		User user = getUser(request);// 当前用户
		Integer id = user.getUserId();
		UserCheck userCheck = new UserCheck();
		userCheck = userCheckService.findById(id);
		userCheck.setGroupId(groupId);
		userCheckService.updateUserCheck(userCheck);
		return new Result<UserCheck>(true, userCheck);
	}

	/**
	 * 选组别页面
	 * 
	 * @param request
	 * @param p
	 * @return
	 */
	@RequestMapping(value = "/user/settings/applyGroup", method = RequestMethod.GET)
	private String choseteam(HttpServletRequest request, HttpServletResponse response) {
		User user = getUser(request);// 当前用户
		Integer id = user.getUserId();
		UserCheck usercheck = new UserCheck();
		usercheck = userCheckService.findById(id);		
		List<QmxGroup> groupList = groupService.findAll();
		request.setAttribute("userCheck", usercheck);
		request.setAttribute("groupList", groupList);
		return "/default/front/user/applyGroup";
	}
	
	/**
	 * 删除一条通知
	 * @param info
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/notice/delone", method = RequestMethod.POST)
	@ResponseBody
	private Result<String> delOneNotice(@RequestParam("noticeId") Integer noticeId) {
		try {
			noticeService.deleteByNoticeId(noticeId);
			return new Result<>(true, "删除成功!");
		} catch (Exception e) {
			return new Result<>(false, "删除失败!");
		}
	}
	
	/**
	 * 删除全部通知
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/notice/delall", method = RequestMethod.POST)
	@ResponseBody
	private Result<String> delAllNotice(HttpServletRequest request) {
		try {
			User user = getUser(request);// 当前用户
			noticeService.deleteByTargetAuthorName(user.getUserName());
			return new Result<>(true, "删除成功!");
		} catch (Exception e) {
			return new Result<>(false, "删除失败!");
		}
	}
	
	
	/**
	 * 删除当前访问记录
	 * @param request
	 * @param noticeAuthorId
	 * @param targetAuthorName
	 * @return
	 */
	@RequestMapping(value = "/user/notice/delvisit", method = RequestMethod.POST)
	@ResponseBody
	private Result<String> delVisstNotice(HttpServletRequest request,@RequestParam("noticeAuthorId") Integer noticeAuthorId,
			@RequestParam("targetAuthorName") String targetAuthorName) {
		try {
			int id = noticeService.selectIdByNoticeAuthorIdAndTargetAuthorName(noticeAuthorId, targetAuthorName);
			noticeService.deleteByNoticeId(id);
			return new Result<>(true, "已隐身访问");
		} catch (Exception e) {
			return new Result<>(false, "删除失败");
		}
	}
}
