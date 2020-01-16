package kr.co.lnssoft.assistshop;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_CartController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_CartController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_cart")
	public String Shop_Cart(Model model, HttpSession session, String page) {
		logger.info("shop_cart");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("")) {
			return "redirect:/shop_login";
		}
		int beginRNum = 1;
		int endRNum = 30;
		if (page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page)*30;
			beginRNum = endRNum-29;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);
		map.put("user_no", uservo.getUser_no());
		List<CartVO> list = sqlSession.selectList("ShopCartMapper.selectuserCart", map);

		model.addAttribute("list", list);
		//////////////////////////////////////
		logger.info(page);
		int totalCnt = sqlSession.selectOne("ShopCartMapper.selectuserCartTotal", map);
		int pagingEnd = totalCnt/30;
		if (totalCnt % 30 > 0) {
			pagingEnd++;
		}
		model.addAttribute("pagingEnd", pagingEnd);
		//////////////////////////////////////
		return "assistshop/shop_cart";
	}
	
	@RequestMapping(value = "/cart_add", method=RequestMethod.POST)
	public void Cart_Add(HttpSession session, CartVO cartvo, PrintWriter out, HttpServletRequest request) {
		logger.info("cart_add");
		
        String ip = GetIP.GetIP(request);
        
        logger.info(">>>> Result : IP Address : "+ip);
        int price = Integer.parseInt(cartvo.getSpt_price());
        int count = Integer.parseInt(cartvo.getSpt_count());
        int del_price = Integer.parseInt(cartvo.getSpt_delivery_price());
		cartvo.setSct_price(String.valueOf(price*count+del_price));
        cartvo.setSct_ins_ip(ip);
        cartvo.setSct_ins_no(cartvo.getUser_no());
		int successCnt = 0;
		successCnt = sqlSession.insert("ShopCartMapper.insertUserCart", cartvo);
		//////////////////////////////////insertProduct
		out.print(successCnt);
		out.close();
		
		
	}
	
	@RequestMapping(value = "/cart_del", method=RequestMethod.POST)
	public String Order_Add(String[] rowChk) {
		logger.info("cart_del");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rowChk", rowChk);
		int successCnt = 0;
		successCnt = sqlSession.delete("ShopCartMapper.deleteCart", map);


		return "redirect:/shop_cart";
		
	}
	

}
