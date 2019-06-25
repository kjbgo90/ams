package net.ourams.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.MyMainPageService;
import net.ourams.util.TimeUtile;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CommunityVo;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;


@Controller
@RequestMapping(value = "/myPage")
public class MyMainPageControllder {

	@Autowired
	private MyMainPageService myMainPageService;
	
	
	@Auth
	@RequestMapping("/mainform")
	public String mainFormPage(@AuthUser UserVo authUser) {
		if(authUser.getUserType() == 1) {
			return "main/myPage";
		}else if(authUser.getUserType() == 0) {
			return "ams/index";
		}
		return "main/mypageForStudent";
	}
	
	@Auth
	@RequestMapping("/mainassignment")
	public String mainassignment(@AuthUser UserVo authUser) {
		if(authUser.getUserType() == 1) {
			return "main/myAssignment";
		}else if(authUser.getUserType() == 0) {
			return "ams/index";
		}
		return "main/myAssignmentForStudent";
	}
	


	@Auth
	@RequestMapping(value = "/mytimeline")
	public String mytimeline( @AuthUser UserVo authUser,
			Model model) {
		System.out.println("start main for student");
		model.addAttribute("authUser", authUser);
		
		return "main/myTimeline";
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/courseList", method = RequestMethod.POST)
	public List<MyPageVo> courseList(@Param("userNo") int userNo){
		System.out.println("courseList start");
		MyPageVo vo = new MyPageVo();
		vo.setUserNo(userNo);
		List<MyPageVo> list = myMainPageService.courseList(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectNotice", method = RequestMethod.POST)
	public List<PostVo> selectNotice(@Param("userNo") int userNo){
		System.out.println("selectNotice start");
		PostVo vo = new PostVo();
		vo.setUserNo(userNo);
		List<PostVo> list = myMainPageService.selectNotice(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/selectQna", method = RequestMethod.POST)
	public List<PostVo> selectQna(@Param("userNo") int userNo){
		System.out.println("selectQna start");
		PostVo vo = new PostVo();
		vo.setUserNo(userNo);
		List<PostVo> list = myMainPageService.selectQna(vo);
		
		System.out.println(list.toString());
		return list;
	}
	

	@ResponseBody
	@RequestMapping(value = "/selectQnaAllList", method = RequestMethod.POST)
	public List<PostVo> selectQnaAllList(@Param("userNo") int userNo){
		System.out.println("selectQna start");
		PostVo vo = new PostVo();
		vo.setUserNo(userNo);
		List<PostVo> list = myMainPageService.selectQnaAllList(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	@Auth
	@RequestMapping(value = "/editForm")
	public String editForm( @AuthUser UserVo authUser) {
		System.out.println("start main");
		
		return "main/editForm";
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String editUser(@RequestParam("username") String userName,
							@RequestParam("userno") int userNo,
							@RequestParam("password") String password,
							@RequestParam("confirmPassword") String confirmPassword) {
		System.out.println("edit user");
		UserVo vo = new UserVo();
		vo.setUserName(userName);
		vo.setUserNo(userNo);
		vo.setPassword(password);
		
		System.out.println(vo.toString());
		myMainPageService.updateUser(vo);
		
		return "redirect:/myPage/mainform";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectTimelineList", method = RequestMethod.POST)
	public List<TimelineVo> selectTimelineList(@Param("userNo") int userNo){
		System.out.println("selectTimelineList start");
		TimelineVo vo = new TimelineVo();
		vo.setUserNo(userNo);
		List<TimelineVo> list = myMainPageService.selectTimelineList(vo);
		System.out.println(list.toString());
		return list; 
	}
	
	
	//timeline 모든 리스트 뽑기 !
	@ResponseBody
	@RequestMapping(value = "/selectTimelineAllList", method = RequestMethod.POST)
	public List<TimelineVo> selectTimelineAllList(@Param("userNo") int userNo){
		System.out.println("selectTimelineList start");
		TimelineVo vo = new TimelineVo();
		vo.setUserNo(userNo);
		List<TimelineVo> list = myMainPageService.selectTimelineAllList(vo);
		System.out.println(list.toString());
		return list; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectAssignmentList", method = RequestMethod.POST)
	public List<SubmitVo> selectAssignmentList(@AuthUser UserVo authUser){
		System.out.println(" selectAssignmentList  start");
		List<SubmitVo> list = myMainPageService.selectAssignmentList(authUser.getUserNo());
		
		System.out.println(" selectAssignmentList  end");
		return list; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCoursePath" , method = RequestMethod.POST)
	public PostVo selectCoursePath(@RequestParam("courseNo") int courseNo) {
		System.out.println("start coursePath");
		PostVo vo = new PostVo();
		vo.setCourseNo(courseNo);
		PostVo postVo = myMainPageService.selectCoursePath(vo);
		return postVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectAssignmentAllList", method = RequestMethod.POST)
	public List<SubmitVo> selectAssignmentAllList( @AuthUser UserVo authUser){
		SubmitVo vo = new SubmitVo();
		vo.setUserNo(authUser.getUserNo());
		List<SubmitVo> list = myMainPageService.selectAssignmentAllList(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/courseNoList", method = RequestMethod.POST)
	public List<Integer> courseNoList(@AuthUser UserVo authUser){
		List<Integer> list = myMainPageService.courseNoList(authUser.getUserNo());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAssignmentByTeacherNo", method = RequestMethod.POST)
	public List<AssignmentVo> getAssignmentByTeacherNo(@RequestParam("userNo") int userNo){
		List<AssignmentVo> list = myMainPageService.getAssignmentByTeacherNo(userNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getSubmitListByUserNo", method = RequestMethod.POST )
	public List<SubmitVo> getSubmitListByUserNo(@RequestParam("userNo") int userNo){
		List<SubmitVo> list = myMainPageService.getSubmitListByUserNo(userNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/assignmentAverageList", method = RequestMethod.POST)
	public Map<String, Object> assignmentAverageList(@RequestParam("courseNo") int courseNo){
		Map<String , Object> map = myMainPageService.assignmentAverageList(courseNo);
		return map;
	}
	
	// community load all list 구민수
	   @ResponseBody
	   @RequestMapping(value="/selectCommunity", method=RequestMethod.POST)
	   public List<CommunityVo> loadAllPost() throws ParseException {
	      System.out.println("load all list... ");
	      
	      List<CommunityVo> communityList = myMainPageService.getAllList();
	      
	      for (CommunityVo el : communityList) {
	         System.out.println(el.getRegDate());
	         String from = el.getRegDate();

	         SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	         Date to = transFormat.parse(from);
	         System.out.println(to);
	         System.out.println(to.getTime());
	         el.setRegDate(TimeUtile.toDuration(new Date().getTime() - to.getTime()));
	      };
	      
	      return communityList;
	   }
}
