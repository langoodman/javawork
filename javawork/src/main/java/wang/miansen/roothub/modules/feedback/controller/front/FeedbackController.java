package wang.miansen.roothub.modules.feedback.controller.front;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import wang.miansen.roothub.common.beans.Result;
import wang.miansen.roothub.modules.feedback.model.Feedback;
import wang.miansen.roothub.modules.feedback.service.FeedbackService;

@Controller
public class FeedbackController {
@Autowired
FeedbackService feedbackService;

/*
 * @param:
 * return:装有全部feedback的list 
 * todo:查询所有反馈信息
 * */
@RequestMapping(value="/feedback/selectAll",method=RequestMethod.POST)
@ResponseBody
public Result<List<Feedback>> selectAll(){
	try {
	List<Feedback> list=feedbackService.selectAll();
	return new Result<List<Feedback>>(true,list);
	}catch(Exception e){
		return new Result<List<Feedback>>(false,"查询失败");
	}
}
/*
 * @param:id
 * return:影响行数
 * todo:根据id删除反馈信息
 * */
@RequestMapping(value="/feedback/deleteById",method=RequestMethod.POST)
@ResponseBody
public Result<Integer> deleteById(@Param("id") int id) {
	try {
	Integer lines=feedbackService.deleteById(id);
	return new Result<Integer>(true,lines);
	}catch(Exception e) {
		return new Result<Integer>(false,"删除失败");
	}
}
/*
 * @param:uid
 * return:影响行数
 * todo:根据用户id删除反馈信息
 * */
@RequestMapping(value="/feedback/deleteByUid",method=RequestMethod.POST)
@ResponseBody
 public Result<Integer> deleteByUid(@Param("uid") int uid) {
	try {
	Integer lines=feedbackService.deleteByUid(uid);
	return new Result<Integer>(true,lines);
	}catch(Exception e) {
		return new Result<Integer>(false,"删除失败");
	}
}

/*
 * @param:
 * return:
 * todo:删除所有反馈信息
 * */

@RequestMapping(value="/feedback/truncateTable",method=RequestMethod.GET)
@ResponseBody
public Result<String> truncateTable() {
	try {
	feedbackService.truncateTable();
	return new Result<>(true,"删除成功");
	}catch(Exception e) {
		return new Result<>(false,"删除失败");
	}
}
	
}
