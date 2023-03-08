package kr.co.wonderland.mvc.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.MyPageDaoInter;
import kr.co.wonderland.mvc.dto.LecturesDTO;

@Controller
@RequestMapping(value="/mypage")
public class MyPageController {
	@Autowired
	private MyPageDaoInter mypageDaoInter;
	
	@RequestMapping(value="/info")
	public ModelAndView myinfo(String sid) {
		ModelAndView mav = new ModelAndView("mypage/myinfo");
		mav.addObject("dto", mypageDaoInter.myinfo(sid));
		return mav;
	}
	
	@RequestMapping(value="/lecture")
	public ModelAndView mylecture(String sid) {
		ModelAndView mav = new ModelAndView("mypage/mylecture");
		List<LecturesDTO> list = mypageDaoInter.lectureinfo(sid);
		List<LecturesDTO> list2 = mypageDaoInter.lectureinfonot(sid);
		for (LecturesDTO e : list) {
			System.out.println(e.getLsnum());
			
		}
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		return mav;
	}
	
	@RequestMapping(value="/study")
	public ModelAndView mystudy() {
		ModelAndView mav = new ModelAndView("mypage/mystudy");
		return mav;
	}
	
	@RequestMapping(value="/answer")
	public ModelAndView myanswer() {
		ModelAndView mav = new ModelAndView("mypage/myanswer");
		return mav;
	}
	
	@RequestMapping(value="/tanswer")
	public ModelAndView myTanswer() {
		ModelAndView mav = new ModelAndView("mypage/teacherAnswer");
		return mav;
	}
	
	@RequestMapping(value = "/question")
    public ModelAndView myquestion(int tnum) {
        ModelAndView mav = new ModelAndView("mypage/myquestion");
        return mav;
    }
}
