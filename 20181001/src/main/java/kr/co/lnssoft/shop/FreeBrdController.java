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
public class FreeBrdController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBrdController.class);
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/freeBrdList", method=RequestMethod.GET)
	public String freeBrdList(Model model) {
		logger.info("freeBrdList");
		
		List<FreeBrdVO> list = sqlSession.selectList("ShopFreeBrdMapper.freebrdlist");
		
		model.addAttribute("list", list);
		return "shop/freebrdlist";
	}
	
	@RequestMapping(value="/freeBrdWrite", method=RequestMethod.GET)
	public String freeBrdWrite(Model model) {
		logger.info("freeBrdWrite");
		
		
		return "shop/freebrdwrite";
	}
	

	
	@RequestMapping(value="/freeBrdInsert", method=RequestMethod.POST)
	public String freeBrdInsert(Model model, FreeBrdVO vo) {
		logger.info("freeBrdInsert");

		int success = sqlSession.insert("ShopFreeBrdMapper.freebrdwrite",vo);

		if (success == 1) {
			freeBrdList(model);
			return "shop/freebrdlist";
		}else {
			return "shop/freebrdwrite";
		}
	}
}
