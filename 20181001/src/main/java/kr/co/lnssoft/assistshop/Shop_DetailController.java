package kr.co.lnssoft.assistshop;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
public class Shop_DetailController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_DetailController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_detail", method=RequestMethod.GET)
	public String Shop_Detail(Model model, String no, HttpSession session) {
		logger.info("shop_detail");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		
		int upSCnt = 0;
		upSCnt = sqlSession.update("DetailMapper.updateDetailHitsCnt", map);
	
		
		ProductVO pvo = new ProductVO();
		pvo = sqlSession.selectOne("DetailMapper.selectProductDetail", map);
		map.put("spt_style_type_no", pvo.getSpt_style_type_no());
		
		List<StyleTypeVO> stypelist = sqlSession.selectList("DetailMapper.selectProductStyleType", map);
		
		List<SizeTempVO> slist = sqlSession.selectList("DetailMapper.selectProductSize", map);
		
		List<ColorTempVO> clist = sqlSession.selectList("DetailMapper.selectProductColor", map);
		
		UserVO uservo = new UserVO();
		uservo = (UserVO) session.getAttribute("userSess");


		if(uservo != null && !uservo.getUser_no().equals("")) {
			map.put("userno", uservo.getUser_no());
			map.put("stt_type_no", slist.get(0).getStt_type_no());
			List<UserSizeTempVO> uslist = sqlSession.selectList("DetailMapper.selectUsersize", map);
			model.addAttribute("uslist",uslist);
		}
		
		model.addAttribute("pvo",pvo);
		model.addAttribute("stypelist",stypelist);
		model.addAttribute("slist",slist);
		model.addAttribute("clist",clist);

		return "assistshop/shop_detail";
	}
	

}
