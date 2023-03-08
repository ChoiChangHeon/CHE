package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.LectureDTO;
import kr.co.wonderland.mvc.dto.LecturesDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Repository
public class MyPageDao implements MyPageDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public StudentDTO myinfo(String sid) {
		return ss.selectOne("mypage.info", sid);
	}

	@Override
	public List<LecturesDTO> lectureinfo(String sid) {
		return ss.selectList("mypage.lectureinfo",sid);
	}

	@Override
	public List<LecturesDTO> lectureinfonot(String sid) {
		return ss.selectList("mypage.lectureinfonot", sid);
	}


}
