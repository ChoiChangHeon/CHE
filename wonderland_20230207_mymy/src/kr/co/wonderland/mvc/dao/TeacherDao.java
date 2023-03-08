package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

@Repository
public class TeacherDao implements TeacherDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addTeacher(TeacherDTO dto) {
		ss.insert("teacher.add", dto);
	}

	@Override
	public List<TeacherDTO> teacherList() {
		return ss.selectList("teacher.list");
	}

	@Override
	public int tidChk(String tid) {
		return ss.selectOne("teacher.tidChk", tid);
	}

	@Override
	public int temailChk(String temail) {
		return ss.selectOne("teacher.temailChk", temail);
	}

	@Override
	public TeacherDTO teacherDetail(int tnum) {
		return ss.selectOne("teacher.detail", tnum);
	}

	@Override
	public List<TeacherDTO> teacherDetail2(int tnum) {
		return ss.selectList("teacher.detail2",tnum);
	}

	@Override
	public List<TeacherQuestionDTO> teacherDetail3(int tnum) {
		return ss.selectList("teacher.detail3",tnum);
	}
}
