package kr.co.wonderland.mvc.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.wonderland.mvc.dao.LectureDaoInter;
import kr.co.wonderland.mvc.dao.MyPageDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;
@RestController
public class MyPageRestController {

	
	@Autowired
	private LectureDaoInter lectureDaoInter;
	
	
	@RequestMapping(value = "/aa", produces = "application/json;charset=utf-8")
	public TeacherDTO abc(int lsnum) {
		TeacherDTO dto = lectureDaoInter.detailLecture(lsnum);
		return dto;
	}
	
}
