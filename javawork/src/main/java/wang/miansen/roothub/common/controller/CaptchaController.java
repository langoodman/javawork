package wang.miansen.roothub.common.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wang.miansen.roothub.common.dto.Captcha;
import wang.miansen.roothub.common.util.Base64Util;
import wang.miansen.roothub.common.util.CookieAndSessionUtil;
import wang.miansen.roothub.common.util.JsonUtil;
import wang.miansen.roothub.common.util.StringUtils;
import wang.miansen.roothub.config.SiteConfig;
import wang.miansen.roothub.modules.collect.service.CollectService;
import wang.miansen.roothub.modules.node.service.NodeTabService;
import wang.miansen.roothub.modules.notice.service.NoticeService;
import wang.miansen.roothub.modules.reply.service.ReplyService;
import wang.miansen.roothub.modules.topic.service.TopicService;
import wang.miansen.roothub.modules.user.model.User;
import wang.miansen.roothub.modules.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import wang.miansen.roothub.third.service.RedisService;

@Controller
public class CaptchaController {
	@RequestMapping(value = "/captcha")
    @ResponseBody
    public String imagecode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        OutputStream os = response.getOutputStream();
        //返回验证码和图片的map
        Map<String, Object> map = Captcha.getImageCode(86, 37, os);
        String simpleCaptcha = "simpleCaptcha";
        request.getSession().setAttribute("simpleCaptcha", map.get("strEnsure").toString().toLowerCase());
        request.getSession().setAttribute("codeTime", new Date().getTime());
        try {
            ImageIO.write((BufferedImage) map.get("image"), "jpg", os);
        } catch (IOException e) {
            return "";
        } finally {
            if (os != null) {
                os.flush();
                os.close();
            }
        }
        return null;
    }




        @RequestMapping(value = "/verify")
        @ResponseBody
        public String checkcode(HttpServletRequest request,
                                HttpSession session,
                                String checkCode) throws Exception {

            checkCode=(String) request.getSession().getAttribute("simpleCaptcha");

            // 获得验证码对象
           /* Object cko = session.getAttribute("simpleCaptcha");*/
            String cko = request.getParameter("checkcode01");

            if (cko == null ||cko=="") {
                request.setAttribute("errorMsg", "请输入验证码！");
                System.out.println("验证码是空格的啊");
                return "请输入验证码！";
            }
            String captcha = cko.toString();//文本框输入的验证码
            // 判断验证码输入是否正确
            Date now = new Date();
            Long codeTime = Long.valueOf(session.getAttribute("codeTime") + "");
            if (StringUtils.isEmpty(checkCode) || captcha == null || !(checkCode.equalsIgnoreCase(captcha))) {
                request.setAttribute("errorMsg", "验证码错误！");
                System.out.println("验证码错的呀");
                return "验证码错误，请重新输入！";

                // 验证码有效时长为1分钟
 
            } else if ((now.getTime() - codeTime) / 1000 / 60 > 1) {
                request.setAttribute("errorMsg", "验证码已失效，请重新输入！");
                System.out.println("验证码时间太长了");
                return "验证码已失效，请重新输入！";
            } else {

                // 在这里可以处理自己需要的事务，比如验证登陆等
                System.out.println("验证码输入正确");
                return "验证通过！";
            }
        }

}