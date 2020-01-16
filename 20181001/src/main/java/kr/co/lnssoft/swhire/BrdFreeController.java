package kr.co.lnssoft.swhire;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

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

import kr.co.lnssoft.assistshop.UtilForFile;

@Controller
public class BrdFreeController {

	private static final Logger logger = LoggerFactory.getLogger(BrdFreeController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/brdfreelist", method=RequestMethod.GET)
	public String brdFreeList(Model model, String page) {
		logger.info("=== brdFreeList ===");
		int beginRNum = 1;
		int endRNum = 10;
		if(page != null && !page.equals("")) {
			endRNum = Integer.parseInt(page) * 10;
			beginRNum = endRNum - 9;
		} else {
			page = "1";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);

		List<VOBrdFree> list =
				sqlSession.selectList("BrdFreeMapper.brdFreeList", map);
		model.addAttribute("brd_list", list);
		/////////////////paging start////////////////////
		int totalCnt = sqlSession.selectOne("BrdFreeMapper.brdFreeListCnt");
		int pagingEnd = totalCnt / 10;
		if(totalCnt % 10 > 0) {
			pagingEnd++;
		}
		model.addAttribute("page", page);
		model.addAttribute("pagingEnd", pagingEnd);
		/////////////////paging end////////////////////
		return "brd_free/list";
	}//brdFreeList

	@RequestMapping(value="/brdfreewrite", method=RequestMethod.GET)
	public String brdWrite(HttpSession session) {
		logger.info("=== brdWrite ===");
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			return "redirect:/brdfreelist";
		}
		return "brd_free/write";
	}//brdWrite

	@RequestMapping(value="/insbrdfree", method=RequestMethod.POST)
	public void insBrdFree(HttpSession session, VOBrdFree vo
			, MultipartRequest multipartRequest, PrintWriter out) {
		logger.info("=== insBrdFree ===");
		int successCnt = 0;
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			out.print(successCnt);
			out.close();
			return;
		}
		//////////////////////////////////file start
		String upFilePath = "";
		MultipartFile file = multipartRequest.getFile("atch_file");
		if(file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
			upFilePath = UtilForFile.fileUpProc(file);
		}//if
		//////////////////////////////////file end
		vo.setAtch_file_nm(upFilePath);
		if(vo.getContents().indexOf(',') == 0) {
			vo.setContents(vo.getContents().substring(1, vo.getContents().length()));
		}
		successCnt = sqlSession.insert("BrdFreeMapper.insBrdFree", vo);
		out.print(successCnt);
		out.close();
	}//insBrdFree

	@RequestMapping(value="/brdfreedetail", method=RequestMethod.GET)
	public String brdFreeDetail(Model model, HttpSession session, VOBrdFree vo) {
		logger.info("=== brdFreeDetail ===");
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			return "redirect:/brdfreelist";
		}
		sqlSession.update("BrdFreeMapper.updateBrdFreeViewCnt", vo);
		vo = sqlSession.selectOne("BrdFreeMapper.brdFreeDetail", vo);
		if(vo.getAtch_file_nm() != null && !vo.getAtch_file_nm().equals("")) {
			vo.setAtch_file_nm_summary(vo.getAtch_file_nm().substring(vo.getAtch_file_nm().lastIndexOf("/")+1, vo.getAtch_file_nm().length()));
		}
		model.addAttribute("brd_detail_vo", vo);
		return "brd_free/detail";
	}//brdFreeDetail

	@RequestMapping(value="/updbrdfreelikecnt", method=RequestMethod.POST)
	public void updBrdFreeLikeCnt(HttpSession session, PrintWriter out, String no) {
		logger.info("=== updBrdFreeLikeCnt ===");
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			out.print(-1);
			out.close();
			return;
		}
		sqlSession.update("BrdFreeMapper.updBrdFreeLikeCnt", no);
		String likeCnt = "";
		likeCnt = sqlSession.selectOne("BrdFreeMapper.brdFreeLikeCnt", no);
		out.println(likeCnt);
		out.close();
	}//updBrdFreeLikeCnt

	@RequestMapping(value="/delbrdfree", method=RequestMethod.POST)
	public void delBrdFree(HttpSession session, VOBrdFree vo, PrintWriter out) {
		logger.info("=== delBrdFree ===");
		int successCnt = 0;
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			out.print(successCnt);
			out.close();
			return;
		}
		if(!sessionVO.getMbr_no().equals(vo.getWrite_mbr_no())) {
			out.print(-1);
			out.close();
			return;
		}
		successCnt = sqlSession.delete("BrdFreeMapper.delBrdFree", vo);
		if(successCnt > 0) {
			if(vo.getAtch_file_nm() != null && !vo.getAtch_file_nm().equals("")) {
				File fileForDel = new File("C:/"+vo.getAtch_file_nm());
				fileForDel.delete();
			}
		}
		out.println(successCnt);
		out.close();
	}//delBrdFree

	@RequestMapping(value="/delbrdfreefile", method=RequestMethod.POST)
	public void delBrdFreeFile(HttpSession session, VOBrdFree vo, PrintWriter out) {
		logger.info("=== delBrdFreeFile ===");
		int successCnt = 0;
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			out.print(successCnt);
			out.close();
			return;
		}
		if(!sessionVO.getMbr_no().equals(vo.getWrite_mbr_no())) {
			out.print(-1);
			out.close();
			return;
		}
		successCnt = sqlSession.delete("BrdFreeMapper.delBrdFreeFile", vo);
		if(successCnt > 0) {
			if(vo.getAtch_file_nm() != null && !vo.getAtch_file_nm().equals("")) {
				File fileForDel = new File("C:/"+vo.getAtch_file_nm());
				fileForDel.delete();
			}
		}
		out.println(successCnt);
		out.close();
	}//delBrdFreeFile

	@RequestMapping(value="/brdfreemodify", method=RequestMethod.GET)
	public String brdFreeModify(Model model, HttpSession session, VOBrdFree vo) {
		logger.info("=== brdFreeModify ===");
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			return "redirect:/brdfreelist";
		}
		vo = sqlSession.selectOne("BrdFreeMapper.brdFreeDetail", vo);
		if(vo.getAtch_file_nm() != null && !vo.getAtch_file_nm().equals("")) {
			vo.setAtch_file_nm_summary(vo.getAtch_file_nm().substring(vo.getAtch_file_nm().lastIndexOf("/")+1, vo.getAtch_file_nm().length()));
		}
		model.addAttribute("brd_detail_vo", vo);
		return "brd_free/update";
	}//brdFreeModify

	@RequestMapping(value="/updbrdfree", method=RequestMethod.POST)
	public void updBrdFree(HttpSession session, VOBrdFree vo
			, MultipartRequest multipartRequest, PrintWriter out) {
		logger.info("=== updBrdFree ===");
		int successCnt = 0;
		VOMbr sessionVO = (VOMbr) session.getAttribute("usrSesn");
		if(sessionVO == null || sessionVO.getMbr_no().equals("")) {
			out.print(successCnt);
			out.close();
			return;
		}
		if(!sessionVO.getMbr_no().equals(vo.getWrite_mbr_no())) {
			out.print(-1);
			out.close();
			return;
		}
		//////////////////////////////////file start
		String upFilePath = "";
		MultipartFile file = multipartRequest.getFile("atch_file");
		logger.info("=== 222 ==="+file);
		if(file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
			upFilePath = UtilForFile.fileUpProc(file);
		}//if
		//////////////////////////////////file end
		vo.setAtch_file_nm(upFilePath);
		if(vo.getContents().indexOf(',') == 0) {
			vo.setContents(vo.getContents().substring(1, vo.getContents().length()));
		}
		successCnt = sqlSession.update("BrdFreeMapper.updBrdFree", vo);
		out.println(successCnt);
		out.close();
	}//updBrdFree

}//class

/*
create table brd_free_reply(
no number(5,0) primary key
, brd_no number(5,0)
, reply VARCHAR2(1500)
, reply_date date
);

create sequence brd_free_reply_no_seq
start with 1
maxvalue 99999
increment by 1
nocycle;
*/
