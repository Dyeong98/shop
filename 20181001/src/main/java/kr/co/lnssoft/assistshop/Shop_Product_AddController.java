package kr.co.lnssoft.assistshop;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.lnssoft.FillSBVO;
import kr.co.lnssoft.shop.MainController;
import kr.co.lnssoft.swhire.VOMbr;

@Controller
public class Shop_Product_AddController {

	private static final Logger logger = LoggerFactory.getLogger(Shop_Product_AddController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/shop_product_add", method=RequestMethod.GET)
	public String shop_Product_Add(Model model, HttpSession session) {
		logger.info("shop_product_add");
		UserVO uservo = (UserVO) session.getAttribute("userSess");

		if(uservo == null || uservo.getUser_no().equals("") || uservo.getUser_no().equals("1")) {
			return "redirect:/shop_login";
		}
		List<PttVO> Type1List = sqlSession.selectList("ShopProductTypeMapper.selectproductType1");
		List<StyleTypeVO> StyleList = sqlSession.selectList("ShopStyleMapper.selectStyleType1");
		model.addAttribute("Type1List", Type1List);
		model.addAttribute("StyleList", StyleList);
		
		return "assistshop/shop_product_add";
	}
	
	@RequestMapping(value = "/shop_product_type2", method=RequestMethod.GET)
	public void shop_Product_Type2(Model model, PrintWriter out, String ptt_type1_no) {
		logger.info("shop_product_add");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ptt_type1_no", ptt_type1_no);
		List<PttVO> list2 = sqlSession.selectList("ShopProductTypeMapper.selectproductType2", map);
		JSONArray arr = new JSONArray();
		for(int i=0; i<list2.size(); i++) {
			PttVO vo = list2.get(i);
			JSONObject obj = new JSONObject();
			obj.put("ptt_type2_no", vo.getPtt_type2_no());
			obj.put("ptt_type2_nm", vo.getPtt_type2_nm());
			arr.add(obj);
		}
		String jsonStr = arr.toString();
		out.print(jsonStr);
		out.close();
	}
	
	@RequestMapping(value = "/shop_style_type", method=RequestMethod.GET)
	public void shop_Style_Type(Model model, PrintWriter out, String stt_type_no) {
		logger.info("shop_style_type");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("stt_type_no", stt_type_no);
		List<StyleTypeVO> StyleList2 = sqlSession.selectList("ShopStyleMapper.selectStyleType2", map);
		JSONArray arr = new JSONArray();
		for(int i=0; i<StyleList2.size(); i++) {
			StyleTypeVO vo = StyleList2.get(i);
			JSONObject obj = new JSONObject();
			obj.put("stt_no", vo.getStt_no());
			obj.put("stt_type_no", vo.getStt_type_no());
			obj.put("stt_type_no", vo.getStt_type_nm());
			obj.put("stt_size", vo.getStt_size());
			obj.put("stt_size_no", vo.getStt_size_no());
			obj.put("stt_size_nm", vo.getStt_size_nm());
			arr.add(obj);
		}
		String jsonStyleStr = arr.toString();
		out.print(jsonStyleStr);
		out.close();
	}

	@RequestMapping(value="/shop_product_ins", method=RequestMethod.POST)
	public void insBrdFree(HttpSession session, ProductVO pvo, ColorVO colorvo, SizeVO sizevo, MultipartRequest multipartRequest, PrintWriter out, HttpServletRequest request) {
		logger.info("shop_product_ins");
		
        String ip = GetIP.GetIP(request);
        
        logger.info(">>>> Result : IP Address : "+ip);
        pvo.setSpt_ins_ip(ip);
		int successCnt = 0;
		//////////////////////////////////file start
		String upFilePath = "";
		MultipartFile file = multipartRequest.getFile("thumbnail");
		if(file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
			upFilePath = UtilForFile.fileUpProc(file);
		}//if
		//////////////////////////////////file end
		pvo.setSpt_thumbnail(upFilePath);

        logger.info(pvo.getSpt_delivery_price());
		if (pvo.getSpt_delivery().equals("0")) {
			pvo.setSpt_delivery_price("0");
		}
		successCnt = sqlSession.insert("ShopProductAddMapper.insertProduct", pvo);
		//////////////////////////////////insertProduct
		sizevo.setSpt_no(pvo.getSpt_no());
		sizevo.setSps_ins_no(pvo.getSpt_ins_no());
		sizevo.setSps_ins_ip(pvo.getSpt_ins_ip());
		sizevo.setStt_type_no(pvo.getSpt_style_type_no());
		
		SizeTempVO svo = new SizeTempVO();
		svo.setSpt_no(sizevo.getSpt_no());
		svo.setSpt_type1_no(sizevo.getSpt_type1_no());
		svo.setSpt_type2_no(sizevo.getSpt_type2_no());
		svo.setStt_type_no(sizevo.getStt_type_no());
		svo.setSps_ins_no(sizevo.getSps_ins_no());
		svo.setSps_ins_ip(sizevo.getSps_ins_ip());
		
		String type_no = sizevo.getStt_type_no();
		for (int i = 0; i < sizevo.getSps_size().length; i++) {
			svo.setSps_size(sizevo.getSps_size()[i]);
			if (type_no.equals("101") || type_no.equals("102") || type_no.equals("104")) {
				svo.setTop_tot_leng(sizevo.getTop_tot_leng()[i]);
				svo.setTop_shoul_wid(sizevo.getTop_shoul_wid()[i]);
				svo.setTop_chest_wid(sizevo.getTop_chest_wid()[i]);
				svo.setTop_sleeve_leng(sizevo.getTop_sleeve_leng()[i]);
			}
			if (type_no.equals("103")) {
				svo.setTop_tot_leng(sizevo.getTop_tot_leng()[i]);
				svo.setTop_shoul_wid(sizevo.getTop_shoul_wid()[i]);
				svo.setTop_chest_wid(sizevo.getTop_chest_wid()[i]);
			}
			if (type_no.equals("201") || type_no.equals("202")  || type_no.equals("203")  || type_no.equals("204") ) {
				svo.setOut_tot_leng(sizevo.getOut_tot_leng()[i]);
				svo.setOut_shoul_wid(sizevo.getOut_shoul_wid()[i]);
				svo.setOut_chest_wid(sizevo.getOut_chest_wid()[i]);
				svo.setOut_sleeve_leng(sizevo.getOut_sleeve_leng()[i]);
			}
			if (type_no.equals("301") ) {
				svo.setOne_tot_leng(sizevo.getOne_tot_leng()[i]);
				svo.setOne_shoul_wid(sizevo.getOne_shoul_wid()[i]);
				svo.setOne_chest_wid(sizevo.getOne_chest_wid()[i]);
				svo.setOne_sleeve_leng(sizevo.getOne_sleeve_leng()[i]);
			}
			if (type_no.equals("401")  || type_no.equals("402")  || type_no.equals("404") ) {
				svo.setBot_outseam(sizevo.getBot_outseam()[i]);
				svo.setBot_waist_wid(sizevo.getBot_waist_wid()[i]);
				svo.setBot_thigh_wid(sizevo.getBot_thigh_wid()[i]);
				svo.setBot_rise(sizevo.getBot_rise()[i]);
				svo.setBot_hem(sizevo.getBot_hem()[i]);
			}
			if (type_no.equals("403") ) {
				svo.setBot_outseam(sizevo.getBot_outseam()[i]);
				svo.setBot_waist_wid(sizevo.getBot_waist_wid()[i]);
				svo.setBot_hem(sizevo.getBot_hem()[i]);
			}
			if (type_no.equals("501") ) {
				svo.setSho_foot_leng(sizevo.getSho_foot_leng()[i]);
				svo.setSho_foot_ball(sizevo.getSho_foot_ball()[i]);
				svo.setSho_ankle_hei(sizevo.getSho_ankle_hei()[i]);
				svo.setSho_hell_hei(sizevo.getSho_hell_hei()[i]);
			}
			if (type_no.equals("601") ) {
				svo.setUn_waist_wid(sizevo.getUn_waist_wid()[i]);
			}
			if (type_no.equals("602") ) {
				svo.setUn_cup_size(sizevo.getUn_cup_size()[i]);
			}
			if (type_no.equals("603") ) {
				svo.setUn_socks_leng(sizevo.getUn_socks_leng()[i]);
			}
			if (type_no.equals("701")  || type_no.equals("702")  || type_no.equals("704")  || type_no.equals("706")  || type_no.equals("707")  || type_no.equals("708") ) {
				svo.setBag_height(sizevo.getBag_height()[i]);
				svo.setBag_width(sizevo.getBag_width()[i]);
				svo.setBag_depth(sizevo.getBag_depth()[i]);
			}
			if (type_no.equals("703")  || type_no.equals("705") ) {
				svo.setBag_height(sizevo.getBag_height()[i]);
				svo.setBag_width(sizevo.getBag_width()[i]);
				svo.setBag_depth(sizevo.getBag_depth()[i]);
				svo.setBag_strap_leng(sizevo.getBag_strap_leng()[i]);
			}
			successCnt = sqlSession.insert("ShopProductAddMapper.insertProductSize", svo);
		}
		//////////////////////////////////insertProductSize
		colorvo.setSpt_no(pvo.getSpt_no());
		colorvo.setSpc_ins_no(pvo.getSpt_ins_no());
		colorvo.setSpc_ins_date(pvo.getSpt_ins_date());
		colorvo.setSpc_ins_ip(pvo.getSpt_ins_ip());
		successCnt = sqlSession.insert("ShopProductAddMapper.insertProductColor", colorvo);
		//////////////////////////////////insertProductColor
		out.print(successCnt);
		out.close();
	}//shop_product_ins
	

}
