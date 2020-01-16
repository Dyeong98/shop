package kr.co.lnssoft;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DaumController {
	
	private static final Logger logger = LoggerFactory.getLogger(DaumController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/daummain", method=RequestMethod.GET)
	public String DaumMain() {
		logger.info("daummain");
		
		return "daummain";
	}
}
