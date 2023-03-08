package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.LectureDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface LectureDaoInter {
	// 강의 추가
	public void addLecture(LectureDTO dto);
	// 과목을 선택했을 때, 해당 과목의 선생님 목록을 가져오는 메서드
	public List<TeacherDTO> getTeacher(String lsubject);
	
	// 강의 리스트 추가 => Teacher : Lecture = 1 : N
	public List<TeacherDTO> lectureList();
	// 강의 정보
	public TeacherDTO detailLecture(int lnum);
}
