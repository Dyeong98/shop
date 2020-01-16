package kr.co.lnssoft.assistshop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lnssoft.shop.MainController;
import kr.co.lnssoft.swhire.VOMbr;

@Controller
public class Shop_JoinController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_JoinController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_join", method=RequestMethod.GET)
	public String Shop_Join() {
		logger.info("shop_join");
		
		
		
		return "assistshop/shop_join";
	}

	@RequestMapping(value = "/shop_join_idchk", method = RequestMethod.POST)
	public void Shop_Join_IDChk(UserVO vo, PrintWriter out)
			throws IOException {
		logger.info("=== shop_join_idchk ===");
		logger.info(vo.getUser_id());
		int cnt = sqlSession.selectOne("ShopJoinMapper.selectjoinIDChk", vo);
		out.print(cnt);
	}//joinIDCheck
	
	@RequestMapping(value = "/shop_join_ins", method=RequestMethod.POST)
	public void Shop_Join_Ins(UserVO vo, PrintWriter out, HttpServletRequest request) {
		logger.info("shop_join_ins");
		
        String ip = GetIP.GetIP(request);
        
        logger.info(">>>> Result : IP Address : "+ip);
        vo.setUser_join_ip(ip);
        
		int successCnt = 0;
		successCnt = sqlSession.insert("ShopJoinMapper.insertjoinUser", vo);
		out.print(successCnt);
		out.close();
	}

}
