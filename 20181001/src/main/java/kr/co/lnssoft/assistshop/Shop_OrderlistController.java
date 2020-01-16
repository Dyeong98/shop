package kr.co.lnssoft.assistshop;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_OrderlistController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_OrderlistController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_orderlist")
	public String Shop_Orderlist() {
		logger.info("shop_orderlist");
		
		
		
		return "assistshop/shop_orderlist";
	}
	

}
