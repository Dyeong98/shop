package kr.co.lnssoft.assistshop;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_OrderController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_OrderController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_order", method=RequestMethod.POST)
	public String shop_Order(Model model, HttpSession session, OrderVO ordervo, HttpServletRequest request) {
		logger.info("shop_order");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("")) {
			return "redirect:/shop_login";
		}
		
        String ip = GetIP.GetIP(request);
        
        logger.info(">>>> Result : IP Address : "+ip);
        int price = Integer.parseInt(ordervo.getSpt_price());
        int count = Integer.parseInt(ordervo.getSpt_count());
        int del_price = Integer.parseInt(ordervo.getSpt_delivery_price());
        ordervo.setSpo_price(String.valueOf(price*count+del_price));
        ordervo.setSpo_ins_ip(ip);
        ordervo.setSpo_ins_no(ordervo.getUser_no());
		int successCnt = 0;

		successCnt = sqlSession.insert("OrderMapper.insertOrderCart", ordervo);
		////////////////////////////////insertProduct
		
		if (successCnt == 0) {
			return "redirect:/shop_error";
		}
		
		List<CartVO> list = sqlSession.selectList("OrderMapper.selectOrderCart", ordervo);
		

		model.addAttribute("list", list);
		
		return "assistshop/shop_order";
	}
	
	@RequestMapping(value = "/user_Addr", method=RequestMethod.POST)
	public void userAddr(HttpSession session, PrintWriter out) {
		logger.info("user_Addr");
		UserVO uservo = (UserVO) session.getAttribute("userSess");
		UserAddrVO userAddrlist = sqlSession.selectOne("MypageMapper.selectUserAddr", uservo);

		if (userAddrlist == null || userAddrlist.getUser_no().equals("")) {
			int succCnt = 0;
			out.print(succCnt);
			out.close();
		}
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("user_no", userAddrlist.getUser_no());
		obj.put("sua_name", userAddrlist.getSua_name());
		obj.put("sua_phone", userAddrlist.getSua_phone());
		obj.put("sua_post_code", userAddrlist.getSua_post_code());
		obj.put("sua_addr1", userAddrlist.getSua_addr1());
		obj.put("sua_addr2", userAddrlist.getSua_addr2());
		arr.add(obj);
		
		String jsonStyleStr = arr.toString();
		out.print(jsonStyleStr);
		out.close();
		
		
	}
	
	@RequestMapping(value = "/shop_payment", method=RequestMethod.GET)
	public String shop_Payment() {
		logger.info("shop_payment");
		
		return "assistshop/shop_payment";
	}
	
	@RequestMapping(value = "/order_add", method=RequestMethod.POST)
	public void order_Add(HttpSession session, OrderVO ordervo, PrintWriter out, HttpServletRequest request) {
		logger.info("order_add");
		UserVO uservo = (UserVO) session.getAttribute("userSess");
        String ip = GetIP.GetIP(request);
        
        ordervo.setSpo_ins_ip(ip);
        ordervo.setSpo_ins_no(uservo.getUser_no());
        int successCnt = 0;
        if (ordervo.getDefault_order() != null && !ordervo.getDefault_order().equals("") && ordervo.getDefault_order().equals("1")) {
            HashMap<String, String> usermap = new HashMap<String, String>();
            usermap.put("user_no", ordervo.getUser_no());
            usermap.put("sua_name", ordervo.getSpo_name());
            usermap.put("sua_phone", ordervo.getSpo_phone());
            usermap.put("sua_post_code", ordervo.getSpo_post_code());
            usermap.put("sua_addr1", ordervo.getSpo_addr1());
            usermap.put("sua_addr2", ordervo.getSpo_addr2());
        	int userCnt = sqlSession.selectOne("MypageMapper.selectUserAddrCnt", usermap);
        	if (userCnt == 0) {
                usermap.put("sua_ins_ip", ordervo.getSpo_ins_ip());
        		successCnt = sqlSession.insert("MypageMapper.insertUserAddr", usermap);
			}else if (userCnt == 1) {
	            usermap.put("sua_update_ip", ordervo.getSpo_ins_ip());
        		successCnt = sqlSession.update("MypageMapper.updateUserAddr", usermap);
			}else {
				out.print(successCnt);
				out.close();
			}
        }
        int price = Integer.parseInt(ordervo.getSpt_price());
        int count = Integer.parseInt(ordervo.getSpt_count());
        int del_price = Integer.parseInt(ordervo.getSpt_delivery_price());
        
        HashMap<String, String> promap = new HashMap<String, String>();
        promap.put("spt_no", ordervo.getSpt_no());
        
        int proCount = sqlSession.selectOne("OrderMapper.selectProductCnt", promap);
        
        if (proCount == 0) {
    		successCnt = sqlSession.delete("OrderMapper.deleteOrderCart", ordervo);
        	successCnt = -1;
			out.print(successCnt);
			out.close();
        }
        
        int pro_cnt = proCount - count;
        promap.put("pro_cnt", String.valueOf(pro_cnt));
        
        successCnt = sqlSession.update("OrderMapper.updateProductCnt", promap);
        
        ordervo.setSpo_price(String.valueOf(price*count+del_price));
		successCnt = sqlSession.insert("OrderMapper.insertOrder", ordervo);
		//////////////////////////////////insertProduct
		
		successCnt = sqlSession.delete("OrderMapper.deleteOrderCart", ordervo);
		out.print(successCnt);
		out.close();
		
		
	}
	
	@RequestMapping(value = "/shop_order_end", method=RequestMethod.GET)
	public String shop_Order_End() {
		logger.info("shop_order_end");
		
		return "assistshop/shop_order_end";
	}
	

}
