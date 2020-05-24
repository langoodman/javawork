package wang.miansen.roothub.modules.qmxGroup.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import wang.miansen.roothub.common.controller.BaseController;
import wang.miansen.roothub.modules.qmxGroup.model.QmxGroup;
import wang.miansen.roothub.modules.qmxGroup.service.qmxGroupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QmxGroupController extends BaseController {
private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private qmxGroupService groupService;
	
	@RequestMapping(value = "/groups")
	private String nodes(HttpServletRequest request) {
		List<QmxGroup> groupList = groupService.findAll();
		request.setAttribute("groupList", groupList);
		return "/default/front/register.jsp";
	}
	
}