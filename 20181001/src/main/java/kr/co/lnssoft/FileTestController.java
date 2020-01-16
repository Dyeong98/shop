package kr.co.lnssoft;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
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
public class FileTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileTestController.class);

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/fileform1", method=RequestMethod.GET)
	public String fileForm1() {
		logger.info("fileform1");
		
		return "file_form1";
	}
	
	@RequestMapping(value="/fileup1", method=RequestMethod.POST)
	public String fileUp1(MultipartRequest multipartRequest) throws IOException {
		logger.info("fileup1");
		MultipartFile file = multipartRequest.getFile("cumbu1");
		String ofileName = file.getOriginalFilename();
		String cType = file.getContentType();
		long size = file.getSize();
		InputStream in = file.getInputStream();
		OutputStream out = new FileOutputStream("C:/upload/"+ofileName);
		FileCopyUtils.copy(in, out);
		
		logger.info(ofileName);
		logger.info(cType);
		logger.info("size : "+size);
		
		return "redirect:/fileform1";
	}
	
	@RequestMapping(value="/fileform2", method=RequestMethod.GET)
	public String fileForm2() {
		logger.info("fileform2");
		
		return "file_form2";
	}
	
	@RequestMapping(value="/fileup2", method=RequestMethod.POST)
	public String fileUp2(String title, MultipartRequest multipartRequest) throws IOException {
		logger.info("fileup2");
		logger.info(title);

		InputStream in = null;
		OutputStream out = null;
		Iterator<String> itor = multipartRequest.getFileNames();
		while(itor.hasNext()) {
			MultipartFile file = multipartRequest.getFile(itor.next());
			in = file.getInputStream();
			out = new FileOutputStream("C:/upload/"+file.getOriginalFilename());
			FileCopyUtils.copy(in, out);
		}
		return "redirect:/fileform2";
	}
	
	@RequestMapping(value="/fileform3", method=RequestMethod.GET)
	public String fileForm3() {
		logger.info("fileform3");
		
		return "file_form3";
	}
	
	@RequestMapping(value="/fileup3", method=RequestMethod.POST)
	public String fileUp3(MultipartRequest multipartRequest) throws IOException {
		logger.info("fileup3");
		MultipartFile file = multipartRequest.getFile("cumbu4");
		String oName = file.getOriginalFilename();
		logger.info("파일이름 : "+oName);
		int endIndex = oName.lastIndexOf(".");
		String onlyName = oName.substring(0, endIndex);
		logger.info(onlyName);
		String onlyType = oName.substring(endIndex, oName.length());
		logger.info(onlyType);
		
		Date today = new Date();
		DateFormat siganFormat = new SimpleDateFormat("yyyMMdd_HHmmss");
		String sigan = siganFormat.format(today);
		logger.info("업로드 시분초"+sigan);
		logger.info("수정된 이름"+onlyName+"_"+sigan+onlyType);
		DateFormat naljaFormat = new SimpleDateFormat("yyyMMdd");
		String nalja = naljaFormat.format(today);
		logger.info("업로드 날자"+nalja);
		
		String folderName = "C:/upload/"+nalja;
		File upFolder = new File(folderName);
		if(!upFolder.exists()) {
			upFolder.mkdirs();
		}
		logger.info("폴더이름 : "+folderName);
		
		InputStream in = file.getInputStream();
		OutputStream out = new FileOutputStream(upFolder+"/"+onlyName+"_"+sigan+onlyType);
		FileCopyUtils.copy(in, out);
		in.close();
		out.close();
		
		return "redirect:/fileform3";
	}
}
