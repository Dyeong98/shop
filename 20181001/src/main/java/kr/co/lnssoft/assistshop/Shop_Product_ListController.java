package kr.co.lnssoft.assistshop;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_Product_ListController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_Product_ListController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_product_list")
	public String Shop_Product_List() {
		logger.info("shop_product_list");
		
		
		
		return "assistshop/shop_product_list";
	}
	

}
