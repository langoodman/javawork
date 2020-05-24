package wang.miansen.roothub.modules.vote.controller.front;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import wang.miansen.roothub.common.beans.Result;
import wang.miansen.roothub.common.controller.BaseController;
import wang.miansen.roothub.common.dto.DMLExecution;
import wang.miansen.roothub.modules.topic.service.TopicService;
import wang.miansen.roothub.modules.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import wang.miansen.roothub.modules.vote.model.UpDown;
import wang.miansen.roothub.modules.vote.service.UpDownService;

/**
 * 点赞或者点踩
 * @author sen
 * 2018年8月11日
 * 下午3:14:18
 * TODO
 */
@RestController
@RequestMapping(value = "/topic")
public class UpDownController extends BaseController {

	@Autowired
	private UpDownService upDownService;
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value = "/vote",method = RequestMethod.GET)
	private Result<DMLExecution> up(Integer tid, boolean vote, HttpServletRequest request){
		if( getUser(request) == null ){
			return new Result<>(false,"未登录");
		}
		User user = getUser(request);
		UpDown upDown = new UpDown();
		if(upDownService.selectExsit(user.getUserId(), tid)!=null) {
			upDown=upDownService.selectExsit(user.getUserId(), tid);
			if(upDown.isDelete()) {
				upDown.setDelete(false);
				if(vote) {
					topicService.addGood(tid);
				}else {
					topicService.addBad(tid);
				}
			}
			else {//没有删除
				if(vote) {
					if( upDown.isUpDown() ){
						upDown.setDelete(true);
						topicService.minusGood(tid);
					}
					else{
						topicService.addGood(tid);
						topicService.minusBad(tid);
					}
				}
				else {
					if( upDown.isUpDown() ){
						topicService.addBad(tid);
						topicService.minusGood(tid);
					}
					else{
						upDown.setDelete(true);
						topicService.minusBad(tid);
					}
				}
			}
			upDown.setUpDown(vote);
			DMLExecution update=upDownService.update(upDown);
			return new Result<DMLExecution>(true,update);
		}
		upDown.setUid(user.getUserId());
		upDown.setTid(tid);
		upDown.setUpDown(vote);
		upDown.setCreateDate(new Date());
		upDown.setDelete(false);
		DMLExecution save = upDownService.save(upDown);
		if(vote) {
			topicService.addGood(tid);
		}else {
			topicService.addBad(tid);
		}
		return new Result<DMLExecution>(true,save);
	}
	
	@RequestMapping(value = "/vote/count",method = RequestMethod.GET)
	private Result<Integer> count(Integer tid,boolean vote){
		int countUpOrDown = upDownService.countUpOrDown(tid, vote?1:0);
		Integer integer = new Integer(countUpOrDown);
		return new Result<Integer>(true, integer);
	}
	

}
