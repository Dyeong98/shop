package kr.co.lnssoft;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lnssoft.shop.MbrVO;

@Controller
public class SessionTestController {

	private static final Logger logger = LoggerFactory.getLogger(SessionTestController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/loginsessionform", method=RequestMethod.GET)
	public String loginSessionForm() {
		logger.info("loginSessionForm");
		return "login_session_form";
	}//loginSessionForm

	@RequestMapping(value="/loginsessiontest", method=RequestMethod.GET)
	public String loginSessionTest(MbrVO vo, HttpSession session) {
		logger.info("loginSessionTest");
		logger.info(vo.getMbr_id());
		logger.info(vo.getMbr_pwd());
		vo = sqlSession.selectOne("ShopMemberMapper.loginCheck", vo);
		session.setAttribute("userSession", vo);
		return "login_session_page";
	}//loginSessionTest

	@RequestMapping(value="/loginsessionmypage", method=RequestMethod.GET)
	public String loginSessionMypage(HttpSession session) {
		logger.info("loginSessionMypage");
		MbrVO sessionVO = (MbrVO) session.getAttribute("userSession");
		if(sessionVO == null || sessionVO.getMbr_nm().equals("")) {
			return "redirect:/loginsessionform";
		}
		return "login_session_myPage";
	}//loginSessionMypage

	@RequestMapping(value="/loginsessionout", method=RequestMethod.GET)
	public String loginSessionOut(HttpSession session) {
		logger.info("loginSessionOut");
		session.invalidate();
		return "redirect:/loginsessionform";
	}//loginSessionOut

}








