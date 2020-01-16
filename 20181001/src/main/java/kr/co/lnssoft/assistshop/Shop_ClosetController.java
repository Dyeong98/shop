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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.lnssoft.shop.MainController;

@Controller
public class Shop_ClosetController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_ClosetController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_closet", method=RequestMethod.GET)
	public String Shop_Closet(Model model, HttpSession session, String page) {
		logger.info("shop_closet");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("")) {
			return "redirect:/shop_login";
		}
		
		return "assistshop/shop_closet";
	}
	
	@RequestMapping(value = "/closet_add", method=RequestMethod.POST)
	public String Closet_Add(HttpSession session, ClosetVO cvo, MultipartRequest multipartRequest, PrintWriter out, HttpServletRequest request) {
		logger.info("shop_closet");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("")) {
			return "redirect:/shop_login";
		}
		
        String ip = GetIP.GetIP(request);
        
        logger.info(">>>> Result : IP Address : "+ip);
        cvo.setSuc_ins_no(uservo.getUser_no());
        cvo.setSuc_ins_ip(ip);
		int successCnt = 0;
		//////////////////////////////////file start
		String upFilePath = "";
		MultipartFile file = multipartRequest.getFile("thumbnail");
		if(file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
			upFilePath = UtilForFile.fileUpProc(file);
		}//if
		//////////////////////////////////file end
		cvo.setSuc_img(upFilePath);
		
		return "assistshop/shop_closet";
	}
	

}
