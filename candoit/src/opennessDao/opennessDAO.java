package opennessDao;


import java.sql.*;
import servlet1.opennessInsertServlet;
import java.util.ArrayList;

import opennessDao.*;
import com.domain.Member;
//추후 활용 해보는 것으로 하고...
public class opennessDAO {
	private static final opennessDAO instance = new opennessDAO();
	public static opennessDAO getInstance(){return instance;}
	
	 
	public ArrayList<opennessVO> connect() throws ClassNotFoundException, SQLException {

		ArrayList<opennessVO> list = new ArrayList<opennessVO>();

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", "ball4716", "159753");
		Statement stmt = conn.createStatement();

		String sql = "select no, title, contents, writer, to_char(nowdate,'YYMMDD') nowdate from opennessboard order by no desc";
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			opennessVO vo = new opennessVO(rs.getString("no"), rs.getString("title"),
					rs.getString("contents"), rs.getString("writer"),
					rs.getString("nowdate"));
			list.add(vo);
		}

		rs.close();
		stmt.close();

		return list;
	}
	
	public void insertWrite(String writer,String title,String contents) throws ClassNotFoundException, SQLException{
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", "ball4716", "159753");
		Statement stmt = conn.createStatement();

		String sql = "insert into opennessboard (title,contents,nowdate,writer) values('"+title+"','"+contents+"',sysdate,'"+writer+"')";
		ResultSet rs = stmt.executeQuery(sql);
	
		

		rs.close();
		stmt.close();
		
	}

}
