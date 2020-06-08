package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InformationDAO {

	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션 풀을 이용한 데이터 베이스 연결 
	public void getCon() {
		try {
			
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			con = ds.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Vector<InformationBean> getAllBoard(){
		
		Vector<InformationBean> v = new Vector<InformationBean>();
		InformationBean nbean = null;
		getCon();
		
		try {
			
			String sql = "select * from information";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nbean = new InformationBean();
				nbean.setNum(rs.getInt(1));
				nbean.setId(rs.getString(2));
				nbean.setEmail(rs.getString(3));
				nbean.setSubject(rs.getString(4));
				nbean.setPassword(rs.getString(5));
				nbean.setReg_date(rs.getDate(6).toString());
				nbean.setRef(rs.getInt(7));
				nbean.setRe_step(rs.getInt(8));
				nbean.setRe_level(rs.getInt(9));
				nbean.setReadcount(rs.getInt(10));
				nbean.setContent(rs.getString(11));
				
				v.add(nbean);
				
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
}
