package kr.co.lnssoft.shop;

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
public class MbrController {

	private static final Logger logger = LoggerFactory.getLogger(MbrController.class);
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String firstSpring(Model model, MbrVO vo) {
		logger.info("login");
		
		vo = sqlSession.selectOne("ShopMemberMapper.loginCheck", vo);
		model.addAttribute("mbr_vo", vo);
		
		return "shop/shopmain";
	}
}
