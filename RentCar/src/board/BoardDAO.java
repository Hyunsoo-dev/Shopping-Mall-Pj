package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import client.ClientBean;

public class BoardDAO {
	
	
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
	
	
	//하나의 게시물 저장하는 메소드
	public void writeBoard(String id , String subject, String content, ClientBean tbean) {
		
		getCon();
		
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		
		
		try {
			String refsql = "select max(ref) from carbbs";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			
			String sql = "insert into carbbs values (carbbs_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, tbean.getEmail());
			pstmt.setString(3, subject);
			pstmt.setString(4, tbean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, content);
			
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Vector<BoardBean> getAllList(){
		
		
		Vector<BoardBean> v = new Vector<BoardBean>();
		
		getCon();
		try {
			
			String sql = "select * from carbbs order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean dbean = new BoardBean();
				dbean.setNum(rs.getInt(1));
				dbean.setId(rs.getString(2));
				dbean.setEmail(rs.getString(3));
				dbean.setSubject(rs.getString(4));
				dbean.setPassword(rs.getString(5));
				dbean.setReg_date(rs.getDate(6).toString());
				dbean.setRef(rs.getInt(7));
				dbean.setRe_step(rs.getInt(8));
				dbean.setRe_level(rs.getInt(9));
				dbean.setReadcount(rs.getInt(10));
				dbean.setContent(rs.getString(11));
				
				v.add(dbean);
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
		
	}
	
	//하나의 게시물을 가져오는 메소드
	public BoardBean getOneBoard(int num) {
		
		BoardBean dbean = null;
		getCon();
		try {
			
			String countSql = "update carbbs set readCount = readCount + 1 where num = ?";
			pstmt = con.prepareStatement(countSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "select * from carbbs where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dbean = new BoardBean();
				dbean.setNum(rs.getInt(1));
				dbean.setId(rs.getString(2));
				dbean.setEmail(rs.getString(3));
				dbean.setSubject(rs.getString(4));
				dbean.setPassword(rs.getString(5));
				dbean.setReg_date(rs.getDate(6).toString());
				dbean.setRef(rs.getInt(7));
				dbean.setRe_step(rs.getInt(8));
				dbean.setRe_level(rs.getInt(9));
				dbean.setReadcount(rs.getInt(10));
				dbean.setContent(rs.getString(11));
						
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dbean;
	}
	
	public int updateBoard(int num , String subject , String content) {
		int result = 0;
		getCon();
		try {
			
			String sql = "update carbbs set subject = ? , content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			result = pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
