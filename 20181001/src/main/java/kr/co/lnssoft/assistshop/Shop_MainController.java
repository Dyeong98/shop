package kr.co.lnssoft.assistshop;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_MainController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_MainController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_main", method=RequestMethod.GET)
	public String Main_menu(Model model,  String page) {
		logger.info("shop_main");
		int beginRNum = 1;
		int endRNum = 60;
		if (page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page)*60;
			beginRNum = endRNum-59;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);

		List<ProductVO> list = sqlSession.selectList("MainMapper.selectProductMainList", map);
		
		model.addAttribute("list", list);
		//////////////////////////////////////
		logger.info(page);
		int totalCnt = sqlSession.selectOne("MainMapper.selectProductMainListTotal", map);
		int pagingEnd = totalCnt/60;
		if (totalCnt % 60 > 0) {
			pagingEnd++;
		}
		model.addAttribute("pagingEnd", pagingEnd);
		//////////////////////////////////////
		model.addAttribute("totalCnt", totalCnt);
		
		
		
		return "assistshop/shop_main";
	}
	
	@RequestMapping(value = "/shop_menu")
	public String Shop_Menu() {
		logger.info("shop_menu");
		
		
		
		return "assistshop/shop_menu";
	}
	
	@RequestMapping(value = "/shop_error")
	public String Shop_Error() {
		logger.info("shop_error");
		
		
		
		return "assistshop/shop_error";
	}
	

}
