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
public class Shop_SearchController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_SearchController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_search", method=RequestMethod.GET)
	public String Shop_Search(Model model, String stxt, String page) {
		logger.info("shop_search");
		int beginRNum = 1;
		int endRNum = 20;
		if (page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page)*20;
			beginRNum = endRNum-19;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		logger.info(stxt);
		map.put("stxt", stxt);
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);

		List<ProductVO> list = sqlSession.selectList("SearchMapper.selectProductSearchList", map);
		
		model.addAttribute("list", list);
		//////////////////////////////////////
		logger.info(page);
		int totalCnt = sqlSession.selectOne("SearchMapper.selectProductSearchListTotal", map);
		int pagingEnd = totalCnt/20;
		if (totalCnt % 20 > 0) {
			pagingEnd++;
		}
		model.addAttribute("pagingEnd", pagingEnd);
		//////////////////////////////////////
		model.addAttribute("stxt", stxt);
		model.addAttribute("totalCnt", totalCnt);
		
		
		
		return "assistshop/shop_search";
	}
	

}
