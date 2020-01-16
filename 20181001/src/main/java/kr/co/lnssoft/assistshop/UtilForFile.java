package kr.co.lnssoft.assistshop;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UtilForFile {

	public static String fileUpProc(MultipartFile file) {
		//////////////////////////////////file start
		String originFileName = file.getOriginalFilename();
		int endIndex = originFileName.lastIndexOf('.');
		String onlyName = originFileName.substring(0, endIndex);
		String onlyType = originFileName.substring(endIndex, originFileName.length());
		//////////////////////////////////file name 1
		Date today = new Date();
		DateFormat siganFormat = new SimpleDateFormat("HHmmss");
		String sigan = siganFormat.format(today);
		String upFileName = onlyName+"_"+sigan+onlyType;
		//////////////////////////////////file name 2
		DateFormat naljaFormat = new SimpleDateFormat("yyyyMMdd");
		String nalja = naljaFormat.format(today);
		//////////////////////////////////file folder 1
		String folderName = "C:/upload/"+nalja;
		File upFolder = new File(folderName);
		if(!upFolder.exists()){
			upFolder.mkdirs();
		}
		//////////////////////////////////file folder 2
		InputStream fileIS = null;
		OutputStream fileOS = null;
		try {
			fileIS = file.getInputStream();
			fileOS = new FileOutputStream(folderName+"/"+upFileName);
			FileCopyUtils.copy(fileIS, fileOS);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fileIS != null) {
					fileIS.close();
				}
				if(fileOS != null) {
					fileOS.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//////////////////////////////////file end
		return "upload/"+nalja+"/"+upFileName;
	}//makeFilePath

}//class
