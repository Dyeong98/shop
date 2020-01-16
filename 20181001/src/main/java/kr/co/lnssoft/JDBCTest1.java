package kr.co.lnssoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JDBCTest1 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/jdbcTest1", method = RequestMethod.GET)
	public String jdbcTest1(Model model1) throws ClassNotFoundException, SQLException {
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "scott";
//		String password = "tiger";
//		Connection con = DriverManager.getConnection(url, user, password);
//		Statement st = con.createStatement();
//		String sql = "select * from brd";
//		ResultSet rs = st.executeQuery(sql);
//		ArrayList<BrdVO> list = new ArrayList<BrdVO>();
//		while (rs.next()) {
//			BrdVO vo = new BrdVO();
//			vo.setBrd_no(rs.getString("brd_no"));
//			vo.setBrd_tatle(rs.getString("brd_tatle"));
//			vo.setBrd_writer(rs.getString("brd_writer"));
//			vo.setBrd_contents(rs.getString("brd_contents"));
//			list.add(vo);
//		}
		List<BrdVO> list = sqlSession.selectList("BrdMapper.brdlist");
		model1.addAttribute("list", list);
		model1.addAttribute("name", "kimdong");
		return "jdbctest1";
	}
	
}
