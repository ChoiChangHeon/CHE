package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

public interface TeacherDaoInter {
	// ������ ���
	public void addTeacher(TeacherDTO dto);
	// ������ ��� �� ���̵�, �̸��� �ߺ� üũ
	public int tidChk(String tid);
	public int temailChk(String temail);
	
	// ������ ����Ʈ
	public List<TeacherDTO> teacherList();
	
	// ������ ����
	public TeacherDTO teacherDetail(int tnum);
	public List<TeacherDTO> teacherDetail2(int tnum);
	public List<TeacherQuestionDTO> teacherDetail3(int tnum);
}
