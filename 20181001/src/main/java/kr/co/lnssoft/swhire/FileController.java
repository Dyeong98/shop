package kr.co.lnssoft.swhire;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(BrdFreeController.class);

	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	 public void fileDownload(String fn, String fp, HttpServletResponse response)
			 throws IOException{
		logger.info("=== fileDownload ===");

		response.setHeader("Content-Disposition",
				"attachment;filename="+new String(fn.getBytes(),"ISO8859_1"));

		String fullPath = "C:/" + fp;

		ServletOutputStream sout = response.getOutputStream();
		FileInputStream fin = new FileInputStream(fullPath);

		byte[] buf = new byte[1024];
		int size=0;
		while((size=fin.read(buf,0,1024))!=-1){
			sout.write(buf,0,size);
		}
		sout.flush();
		fin.close();
		sout.close();
	}//fileDownload

}
