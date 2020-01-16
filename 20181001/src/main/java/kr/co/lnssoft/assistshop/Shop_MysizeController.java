package kr.co.lnssoft.assistshop;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_MysizeController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_MysizeController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_mysize", method=RequestMethod.GET)
	public String Shop_Mysize(Model model, HttpSession session, String stn) {
		logger.info("shop_mysize");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("")) {
			return "redirect:/shop_login";
		}
		
		if (stn != null && !stn.equals("")) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("stt_type_no", stn);
			List<StyleTypeVO> StyleListAll = sqlSession.selectList("ShopStyleMapper.selectStyleType2", map);
			model.addAttribute("StyleListAll", StyleListAll);
		}
		
		List<StyleTypeVO> StyleList = sqlSession.selectList("ShopStyleMapper.selectStyleType1");
		model.addAttribute("StyleList", StyleList);
		
		return "assistshop/shop_mysize";
	}
	
	@RequestMapping(value = "/insusersize", method=RequestMethod.POST)
	public void InsUserSize(HttpSession session, UserSizeVO usvo, PrintWriter out, HttpServletRequest request) {
		logger.info("insusersize");
		
        String ip = GetIP.GetIP(request);
        logger.info(">>>> Result : IP Address : "+ip);
        usvo.setSus_ins_ip(ip);
        UserSizeTempVO ustempvo = new UserSizeTempVO();
		int successCnt = 0;
		ustempvo.setUser_no(usvo.getUser_no());
		ustempvo.setStt_type_no(usvo.getStt_type_no());
		ustempvo.setSus_ins_no(usvo.getUser_no());
		ustempvo.setSus_ins_ip(usvo.getSus_ins_ip());
		for (int i = 0; i < usvo.getStt_size_no().length; i++) {
			ustempvo.setStt_size_no(usvo.getStt_size_no()[i]);
			ustempvo.setUser_size(usvo.getUser_size()[i]);
			successCnt = sqlSession.insert("ShopMysizeMapper.insertUserSize", ustempvo);
		}
		out.print(successCnt);
		out.close();
		
		
	}
	

}
