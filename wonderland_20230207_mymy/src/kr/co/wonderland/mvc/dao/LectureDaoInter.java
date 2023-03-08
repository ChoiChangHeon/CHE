package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.LectureDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface LectureDaoInter {
	// ���� �߰�
	public void addLecture(LectureDTO dto);
	// ������ �������� ��, �ش� ������ ������ ����� �������� �޼���
	public List<TeacherDTO> getTeacher(String lsubject);
	
	// ���� ����Ʈ �߰� => Teacher : Lecture = 1 : N
	public List<TeacherDTO> lectureList();
	// ���� ����
	public TeacherDTO detailLecture(int lnum);
}
