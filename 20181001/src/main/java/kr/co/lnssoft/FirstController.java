package kr.co.lnssoft;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FirstController {
	
	private static final Logger logger = LoggerFactory.getLogger(FirstController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/myfirstcspring", method=RequestMethod.GET)
	public String firstSpring(Model model) {
		logger.info("my first spring");
		
		List<BrdVO> list = sqlSession.selectList("BrdMapper.brdlist");
		model.addAttribute("brd_list", list);
		return "first";
	}
	
}
