package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.LecturesDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;

public interface MyPageDaoInter {
	public StudentDTO myinfo(String sid);
	public List<LecturesDTO> lectureinfo(String sid);
	public List<LecturesDTO> lectureinfonot(String sid);
}
