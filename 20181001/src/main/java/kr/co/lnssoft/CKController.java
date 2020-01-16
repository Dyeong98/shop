package kr.co.lnssoft;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class CKController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/ckmain", method=RequestMethod.GET)
	public String CKMain() {
		logger.info("CKMain");
		
		return "ck_main";
	}
	
	@RequestMapping(value="/ckmain2", method=RequestMethod.GET)
	public String CKMain2() {
		logger.info("CKMain2");
		
		return "ck_main2";
	}
	
	@RequestMapping(value="/ckpost", method=RequestMethod.POST)
	public String CKPost(String contents) {
		logger.info("CKPost");
		logger.info("contents : "+contents);
		
		return "ck_main2";
	}
	
	@RequestMapping(value="/ckmain3", method=RequestMethod.GET)
	public String CKMain3() {
		logger.info("CKMain3");
		
		return "ck_main3";
	}
	
	@RequestMapping(value="/ckupload", method=RequestMethod.POST)
	public void ckUpload(String CKEditorFuncNum, MultipartRequest multiReq, PrintWriter print) throws IOException {
		logger.info("ckupload");
		Iterator<String> iter = multiReq.getFileNames();
		String fileName = "";
		while (iter.hasNext()) {
			MultipartFile file = multiReq.getFile(iter.next());
			fileName = file.getOriginalFilename();
			InputStream in = file.getInputStream();
			OutputStream out = new FileOutputStream("C:/upload/"+file.getOriginalFilename());
			FileCopyUtils.copy(in, out);
		}
//		print.print("<script type='text/javascript'>"
//					+"window.parent.CKEDITOR.tools.callFunction("
//					+CKEditorFuncNum
//					+",'./resources/img/456.jpg'"
//					+",'OKOKOKOKOKOKOK'"
//					+")</script>");
		JSONObject json = new JSONObject();
		json.put("uploaded", 1);
		json.put("fileName", fileName);
		json.put("url", "./upload/"+fileName);
		print.print(json);
		print.close();
		
	}
}
