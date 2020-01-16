package kr.co.lnssoft.assistshop;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_Sales_ListController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_Sales_ListController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_sales_list")
	public String Shop_Sales_List() {
		logger.info("shop_sales_list");
		
		
		
		return "assistshop/shop_sales_list";
	}
	

}
