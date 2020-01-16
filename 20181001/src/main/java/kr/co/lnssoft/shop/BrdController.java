package kr.co.lnssoft.shop;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BrdController {
	
	private static final Logger logger = LoggerFactory.getLogger(BrdController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/brdmain", method=RequestMethod.GET)
	public String BrdMain() {
		logger.info("brdMain");
		
		return "shop/brdmain";
	}
	
	@RequestMapping(value = "/brdlist", method=RequestMethod.GET)
	public String BrdList(Model model, String page) {
		logger.info("brdList");
		int beginRNum = 1;
		int endRNum = 10;
		if (page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page)*10;
			beginRNum = endRNum-9;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);
		
		List<BrdListVO> list = sqlSession.selectList("BrdListMapper.selectBrdList", map);
		
		model.addAttribute("list", list);
		//////////////////////////////////////
		logger.info(page);
		int totalCnt = sqlSession.selectOne("BrdListMapper.selectBrdListTotal");
		int pagingEnd = totalCnt/10;
		if (totalCnt % 10 > 0) {
			pagingEnd++;
		}
		model.addAttribute("pagingEnd", pagingEnd);
		//////////////////////////////////////
		
		return "shop/brdlist";
	}
	
	@RequestMapping(value="/brdwrite", method=RequestMethod.GET)
	public String BrdWrite(Model model, BrdListVO vo) {
		logger.info("brdwrite");
		
		return "shop/brdwrite";
	}
	
	@RequestMapping(value="/brdinsert", method=RequestMethod.POST)
	public void BrdInsert(BrdListVO vo, PrintWriter out) {
		logger.info("brdinsert");
		
		int sCnt = sqlSession.insert("BrdListMapper.insertBrd", vo);
		
		out.print(sCnt);
		out.close();
	}
	
	@RequestMapping(value="/brddetail", method=RequestMethod.GET)
	public String BrdDetail(BrdListVO vo, Model model) {
		logger.info("brddetail");
		
		sqlSession.update("BrdListMapper.updateBrdViewCnt",vo);
		
		vo = sqlSession.selectOne("BrdListMapper.selectBrdDetail", vo);
		
		model.addAttribute("vo",vo);

		return "shop/brddetail";
	}
	
	@RequestMapping(value="/uplikecnt", method=RequestMethod.POST)
	public void LikeCntUpdate(PrintWriter out, BrdListVO vo) {
		logger.info("LikeCntUpdate");
		
		sqlSession.update("BrdListMapper.updateLikeCnt", vo);

		logger.info("LikeCntSelect");
		
		String likeCnt = sqlSession.selectOne("BrdListMapper.selectLikeCnt",vo);
		
		out.print(likeCnt);
		out.close();
	}
	
	@RequestMapping(value="/brddelete", method=RequestMethod.POST)
	public void BrdDelete(BrdListVO vo, PrintWriter out) {
		logger.info("brddelete");

		int dCnt = sqlSession.delete("BrdListMapper.deleteBrd", vo);
		
		out.print(dCnt);
		out.close();
	}

	@RequestMapping(value="/brdrewrite", method=RequestMethod.POST)
	public String BrdReWrite(Model model, BrdListVO vo) {
		logger.info("brdrewrite");

		vo = sqlSession.selectOne("BrdListMapper.selectBrdDetail", vo);
		
		model.addAttribute("vo", vo);
		
		return "shop/brdrewrite";
	}
	
	@RequestMapping(value="/brdupdate", method=RequestMethod.POST)
	public void BrdUpdate(BrdListVO vo, PrintWriter out) {
		logger.info("brdupdate");
		
		int sCnt = sqlSession.update("BrdListMapper.updateBrd", vo);
		
		out.print(sCnt);
		out.close();
	}
}
