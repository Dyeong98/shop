package kr.co.lnssoft.swhire;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/joinform", method=RequestMethod.GET)
	public String joinForm() {
		logger.info("=== joinForm ===");
		return "login/join_form";
	}//joinForm

	@RequestMapping(value = "/joinidchk", method = RequestMethod.POST)
	public void joinIDCheck(VOMbr vo, PrintWriter out)
			throws IOException {
		logger.info("=== joinIDCheck ===");
		logger.info(vo.getMbr_id());
		int cnt = sqlSession.selectOne("JoinMapper.joinIDChk", vo);
		out.print(cnt);
	}//joinIDCheck

	@RequestMapping(value="/joinins", method=RequestMethod.POST)
	public void joinIns(VOMbr vo, PrintWriter out) {
		logger.info("=== joinIns ===");
		int successCnt = 0;
		successCnt = sqlSession.insert("JoinMapper.joinIns", vo);
		if(vo.getMbr_level().equals("2") && successCnt > 0) {
			successCnt = sqlSession.insert("JoinMapper.joinInsCmpn", vo);
		}
		out.print(successCnt);
		out.close();
	}//joinIns

}//class

/*
create table mbr(
mbr_no number(5,0)
, mbr_id varchar2(30)
, mbr_nm varchar2(30)
, mbr_pwd varchar2(30)
, mbr_tel varchar2(13)
, mbr_emaiil varchar2(50)
, mbr_level number(5,0)
);

create table mbr_cmpn(
mbr_no number(5,0)
, cmpn_reg_no varchar2(12)
, cmpn_nm varchar2(60)
, cmpn_ceo_nm varchar2(30)
, cmpn_start_date varchar2(10)
, cmpn_addr varchar2(300)
, cmpn_desc varchar2(900)
);

CREATE SEQUENCE MBR_NO_SEQ
START WITH 1
MAXVALUE 99999
INCREMENT BY 1
NOCYCLE;

*/






