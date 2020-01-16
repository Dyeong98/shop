package kr.co.lnssoft.assistshop;

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

import kr.co.lnssoft.shop.BrdListVO;
import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_SortController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_SortController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_sort", method=RequestMethod.GET)
	public String Shop_Sort(Model model, String ptn1, String ptn2, String page, String sort_type) {
		logger.info("shop_sort");
		int beginRNum = 1;
		int endRNum = 20;
		if (page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page)*20;
			beginRNum = endRNum-19;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ptn1", ptn1);
		map.put("ptn2", ptn2);
		map.put("sort_type", sort_type);
		map.put("ptt_type1_no", ptn1);
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);

		List<ProductVO> list = sqlSession.selectList("SortMapper.selectProductSortList", map);
		List<SortTyleCntVO> SortTypeList = sqlSession.selectList("SortMapper.selectProductSortTyleCnt", map);
		
		model.addAttribute("list", list);
		model.addAttribute("SortTypeList", SortTypeList);
		//////////////////////////////////////
		logger.info(page);
		int totalCnt = sqlSession.selectOne("SortMapper.selectProductSortListTotal", map);
		int pagingEnd = totalCnt/20;
		if (totalCnt % 20 > 0) {
			pagingEnd++;
		}
		model.addAttribute("pagingEnd", pagingEnd);
		//////////////////////////////////////
		model.addAttribute("ptn1", ptn1);
		model.addAttribute("ptn2", ptn2);
		model.addAttribute("sort_type", sort_type);
		model.addAttribute("totalCnt", totalCnt);
		
		
		
		return "assistshop/shop_sort";
	}
}