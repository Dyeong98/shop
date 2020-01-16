package kr.co.lnssoft;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
public class JsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JsonController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/json1", method=RequestMethod.GET)
	public String ajax1(Model model) {
		logger.info("json1");
		return "json1";
	}
	@RequestMapping(value="/json1call", method=RequestMethod.GET)
	public void ajax1call(Model model, PrintWriter out) throws UnsupportedEncodingException {
		logger.info("json1call");
		JSONObject obj1 = new JSONObject();
		obj1.put("name", "kime");
		obj1.put("age", "21");
		obj1.put("job", "100su");
		JSONObject obj2 = new JSONObject();
		obj2.put("name", "moon");
		obj2.put("age", "211");
		obj2.put("job", "student");
		//2단계 - array에 object담기
		JSONArray arr = new JSONArray();
		arr.add(obj1);
		arr.add(obj2);
		//3단계 - json 문자열 만들기
		String jsonStr = arr.toString();
		
		out.print(jsonStr);
		out.close();
	}

	@RequestMapping(value="/jsonBrdList", method=RequestMethod.GET)
	public void jsonBrdList(Model model, PrintWriter out) {
		logger.info("jsonBrdList");
		List<BrdVO> list = sqlSession.selectList("BrdMapper.brdlist");
		JSONArray arr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			BrdVO vo = list.get(i);
			JSONObject jso = new JSONObject();

			jso.put("no", vo.getBrd_no());
			jso.put("tatle", vo.getBrd_tatle());
			jso.put("writer", vo.getBrd_writer());
			jso.put("contents", vo.getBrd_contents());
			
			arr.add(jso);
		}
		String jsonStr = arr.toString();
		
		out.print(jsonStr);
		out.close();
	}
}
