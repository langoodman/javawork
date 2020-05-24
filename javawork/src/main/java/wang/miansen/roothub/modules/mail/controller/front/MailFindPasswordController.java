package wang.miansen.roothub.modules.mail.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import wang.miansen.roothub.common.beans.Result;
import wang.miansen.roothub.common.util.CreatKey;
import wang.miansen.roothub.common.util.bcrypt.BCryptPasswordEncoder;
import wang.miansen.roothub.modules.mail.service.impl.MailServiceImpl;
import wang.miansen.roothub.modules.user.model.User;
import wang.miansen.roothub.modules.user.service.UserService;
import wang.miansen.roothub.third.service.RedisService;

@Controller
public class MailFindPasswordController {
	@Autowired
	private UserService userService;
	@Autowired
	private MailServiceImpl mailService;
	@Autowired
	private RedisService redisService;

	/**
	 * 忘记密码页面显示
	 *
	 * @return
	 */
	@RequestMapping(value = "/lostpass", method = RequestMethod.GET)
	public String forget() {
		return "/default/front/emailpw";
	}

	/**
	 * 忘记密码提交,然后跳转登录页面
	 *
	 * @param request
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/lostpassword", method = RequestMethod.POST)
	@ResponseBody
	public Result<String> forgetUser(HttpServletRequest request, @RequestParam("email") String account) {
		String username = "";
		User user = new User();
		// 1、获取用户名 username
		user = userService.findByEmail(account);
		if (user != null) {
			username = user.getUserName();
		}
		// 2、判断用户是否存
		if (user != null) {
			System.setProperty("java.net.preferIPv4Stack", "true");
			System.out.println(user);
			// 用户存在

			String key = CreatKey.verifyCode();
			String receiver = user.getEmail();
			String subject = "[启明星工作室]密码重置";// 邮件主题(标题)
			StringBuilder content = new StringBuilder();
			content.append("有人为以下账号请求了密码重置:<br/><br/>");
			content.append("用户名：" + username + "<br/><br/>");
			content.append("若这不是您本人要求的，请忽略本邮件，<br/><br/>");
			content.append("要重置您的密码验证码为<br/><br/>");
			content.append(key);
			mailService.sendHtmlMail(receiver, subject, content.toString());
			redisService.setStringWithTime(account, 1800, key);
			// 2.3、显示登录页面和提示信息

		}
		return new Result<>(true, "success");
	}

	@RequestMapping(value = "/resetpass", method = RequestMethod.POST)
	@ResponseBody
	public Result<User> resetPass(@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("checkcode") String checkcode) {
		System.out.println(email+password+checkcode);
		User user = userService.findByEmail(email);
		String key = redisService.getString(email);
		if(key == null)
		{
			return new Result<User>(false, "超时或邮箱错误");
		}
		else if(!key.equalsIgnoreCase(checkcode))
		{
			return new Result<User>(false, "验证码错误");
		}
		else {
			user.setPassword(new BCryptPasswordEncoder().encode(password));
			userService.updateUser(user);
			return new Result<User>(true, user);
		}
	}
}