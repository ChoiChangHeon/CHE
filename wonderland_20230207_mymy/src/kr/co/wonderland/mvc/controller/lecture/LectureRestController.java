package kr.co.wonderland.mvc.controller.lecture;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.wonderland.mvc.dao.LectureDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@RestController
public class LectureRestController {
	@Autowired
	private LectureDaoInter lectureDaoInter;
	
	@RequestMapping(value="/getTeacher", produces = "application/json;charset=utf-8")
	public String getTeacher(String lsubject){
		List<TeacherDTO> list = lectureDaoInter.getTeacher(lsubject);
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		try {
			jsonData = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		// System.out.println(result);
		// return result;
		return jsonData;
	}
}
