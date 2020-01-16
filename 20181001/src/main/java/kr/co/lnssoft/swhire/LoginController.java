package kr.co.lnssoft.swhire;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/loginform", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("loginForm");
		return "login/login_form";
	}//loginForm

	@RequestMapping(value="/loginproc", method=RequestMethod.POST)
	public void loginProc(VOMbr vo, HttpSession session, PrintWriter out) {
		logger.info("=== loginProc ===");
		vo = sqlSession.selectOne("LoginMapper.loginProc", vo);
		int successCnt = 0;
		if(vo != null && vo.getMbr_no() != null && !vo.getMbr_no().equals("")) {
			successCnt = 1;
			session.setAttribute("usrSesn", vo);
		}
		out.print(successCnt);
		out.close();
	}//loginProc

	@RequestMapping(value="/logoutproc", method=RequestMethod.GET)
	public String logoutProc(HttpSession session) {
		logger.info("=== logoutProc ===");
		session.invalidate();
		return "redirect:/";
	}//logoutProc

}
