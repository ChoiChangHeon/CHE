package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.LectureDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Repository
public class LectureDao implements LectureDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addLecture(LectureDTO dto) {
		ss.insert("lecture.add", dto);
	}

	@Override
	public List<TeacherDTO> lectureList() {
		return ss.selectList("lecture.list");
	}

	@Override
	public TeacherDTO detailLecture(int lnum) {
		return ss.selectOne("lecture.detail", lnum);
	}

	@Override
	public List<TeacherDTO> getTeacher(String lsubject) {
		return ss.selectList("lecture.getTeacher", lsubject);
	}
}
