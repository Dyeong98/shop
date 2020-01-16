package kr.co.lnssoft;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/ajax1", method=RequestMethod.GET)
	public String ajax1(Model model) {
		logger.info("ajax1");
		return "ajax1";
	}
	@RequestMapping(value="/ajax1call", method=RequestMethod.GET)
	public void ajax1call(Model model, PrintWriter out, String id, String pwd) throws UnsupportedEncodingException {
		logger.info("ajax1call");
		out.print(id+ " : 11111111111 :" + pwd);
		out.close();
	}
	
}
