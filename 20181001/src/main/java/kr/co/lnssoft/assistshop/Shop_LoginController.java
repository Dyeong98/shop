package kr.co.lnssoft.assistshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lnssoft.shop.MainController;
import kr.co.lnssoft.shop.MbrVO;

@Controller
public class Shop_LoginController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_LoginController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_login", method=RequestMethod.GET)
	public String shop_Login() {
		logger.info("shop_login");
		
		
		
		return "assistshop/shop_login";
	}//로그인 페이지
	
	@RequestMapping(value = "/shop_login_form", method=RequestMethod.POST)
	public void shop_Login_Form(UserVO vo, HttpSession session, PrintWriter out, HttpServletRequest request) {
		logger.info("shop_login_form");
		String ip = GetIP.GetIP(request);
		vo.setUser_logintry_ip(ip);
		sqlSession.update("ShopLoginMapper.updateloginTry", vo);
		
		int successCnt = 0;
		UserVO uvo = new UserVO();
		uvo = sqlSession.selectOne("ShopLoginMapper.selectloginUser", vo);
		if(uvo != null && uvo.getUser_no() != null && !(uvo.getUser_no().equals(""))) {
			vo.setUser_lastlogin_ip(ip);
			sqlSession.update("ShopLoginMapper.updateloginUser", vo);
			successCnt = 1;
			session.setAttribute("userSess", uvo);
		}
		out.print(successCnt);
		out.close();
	}//로그인
	
	@RequestMapping(value = "/shop_logout", method=RequestMethod.GET)
	public String shop_Logout(HttpSession session) {
		logger.info("shop_logout");
		
		session.invalidate();
		
		return "redirect:/shop_main";
	}//로그아웃
	
	@RequestMapping(value = "/find_id", method=RequestMethod.GET)
	public String shop_Find_Id() {
		logger.info("shop_find_id");
		
		return "assistshop/shop_find_id";
	}//아이디 찾기 페이지
	
	@RequestMapping(value = "/shop_find_id_form", method=RequestMethod.POST)
	public void shop_Find_ID_Form(UserVO vo, PrintWriter out) {
		logger.info("shop_find_id_form");
		
		String userStr = "";
		userStr = sqlSession.selectOne("ShopLoginMapper.selectfindID", vo);
		out.print(userStr);
		out.close();
	}//아이디 찾기
	
	@RequestMapping(value = "/find_pwd", method=RequestMethod.GET)
	public String shop_Find_Pwd() {
		logger.info("shop_find_pwd");
		
		
		
		return "assistshop/shop_find_pwd";
	}
	
	@RequestMapping(value = "/shop_find_pwd_form", method=RequestMethod.POST)
	public void shop_Find_PWD_Form(UserVO vo, PrintWriter out) {
		logger.info("shop_find_pwd_form");
		
		String userStr = "";
		userStr = sqlSession.selectOne("ShopLoginMapper.selectfindPWD", vo);
		out.print(userStr);
		out.close();
	}//아이디 찾기
	

}
