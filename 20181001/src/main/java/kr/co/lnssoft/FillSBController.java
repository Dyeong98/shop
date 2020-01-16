package kr.co.lnssoft;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FillSBController {

	@Autowired
	SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(FillSBController.class);

	@RequestMapping(value="fillsb", method=RequestMethod.GET)
	public String fillSelectBox(Model model) {
		logger.info("fillSelectBox");
		List<FillSBVO> list =
		sqlSession.selectList("FillSelectBoxMapper.classLargeList");
		model.addAttribute("classLargeList", list);
		return "fill_select_box";
	}//fillSelectBox

	@RequestMapping(value="fillsb2", method=RequestMethod.GET)
	public void fillSelectBox2(Model model, PrintWriter out, String l_no) {
		logger.info("fillSelectBox2");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("l_no", l_no);
		List<FillSBVO> list2 =
		sqlSession.selectList("FillSelectBoxMapper.classMiddleList", map);
		JSONArray arr = new JSONArray();
		for(int i=0; i<list2.size(); i++) {
			FillSBVO vo = list2.get(i);
			JSONObject obj = new JSONObject();
			obj.put("m_no", vo.getM_no());
			obj.put("m_nm", vo.getM_nm());
			arr.add(obj);
		}
		String jsonStr = arr.toString();
		out.print(jsonStr);
		out.close();
	}//fillSelectBox2

	@RequestMapping(value="fillsb3", method=RequestMethod.GET)
	public void fillSelectBox3(Model model, PrintWriter out
			, String l_no, String m_no) {
		logger.info("fillSelectBox3");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("l_no", l_no);
		map.put("m_no", m_no);
		List<FillSBVO> list3 =
		sqlSession.selectList("FillSelectBoxMapper.classSmallList", map);
		JSONArray arr = new JSONArray();
		for(int i=0; i<list3.size(); i++) {
			FillSBVO vo = list3.get(i);
			JSONObject obj = new JSONObject();
			obj.put("s_no", vo.getS_no());
			obj.put("s_nm", vo.getS_nm());
			arr.add(obj);
		}
		String jsonStr = arr.toString();
		out.print(jsonStr);
		out.close();
	}//fillSelectBox3

}//class

/*
create table class_l(
l_no number(5,0)
, l_nm varchar2(60)
, l_desc varchar2(300)
);
insert into class_l values(1,'�ƽþ�','��');
insert into class_l values(2,'�����ƴϾ�','��');

create table class_m(
m_no number(5,0)
, l_no number(5,0)
, m_nm varchar2(60)
, m_desc varchar2(300)
);
insert into class_m values(1, 1,'�Ϻ�','��');
insert into class_m values(2, 1,'�븸','��');
insert into class_m values(3, 2,'ȣ��','ȣ');
insert into class_m values(4, 2,'��������','��');

create table class_s(
s_no number(5,0)
, m_no number(5,0)
, l_no number(5,0)
, s_nm varchar2(60)
, s_desc varchar2(300)
);
insert into class_s values(1, 1, 1,'����ī','����');
insert into class_s values(2, 1, 1,'��Ű����','��Ű');
insert into class_s values(3, 2, 1,'Ÿ������','Ÿ����');
insert into class_s values(4, 2, 1,'Ÿ�̿� ����','Ÿ��');
insert into class_s values(5, 3, 2,'�����','���');
insert into class_s values(6, 3, 2,'����ڽ�Ʈ','���');
insert into class_s values(7, 4, 2,'�������� ����','����');
insert into class_s values(8, 4, 2,'�������� �Ϻ�','�ϳ�');
*/