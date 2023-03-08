package kr.co.wonderland.mvc.controller.lecture;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.LectureDaoInter;
import kr.co.wonderland.mvc.dto.LectureDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Controller
@RequestMapping(value = "/lecture")
public class LectureController {

	@Autowired
	private LectureDaoInter lectureDaoInter;

	@GetMapping(value = "/form")
	public String lectureForm() {
		return "lecture/lectureForm";
	}

	@PostMapping(value = "/add")
	public String addLecture(LectureDTO dto) {
		lectureDaoInter.addLecture(dto);
		return "redirect:list";
	}

	@GetMapping(value = "/list")
	public String lectureList(Model m) {
		m.addAttribute("list", lectureDaoInter.lectureList());
		return "lecture/lectureList";
	}

	@GetMapping(value = "/detail")
	public ModelAndView lectureDetail(int lnum) {
		ModelAndView mav = new ModelAndView("lecture/lectureDetail");
		mav.addObject("dto", lectureDaoInter.detailLecture(lnum));
		return mav;
	}
}
