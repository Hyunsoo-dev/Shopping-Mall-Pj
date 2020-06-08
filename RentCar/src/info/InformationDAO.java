package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;
import client.ClientBean;

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
	
	//고객센터 게시판의 모든 게시글을 가져오는 메소드 
	public Vector<InformationBean> getAllInformation(){
		
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
	
	
	
	//하나의 게시물 저장하는 메소드
		public void writeInformation(String id , String subject, String content, ClientBean tbean) {
			
			getCon();
			
			int ref = 0;
			int re_step = 1;
			int re_level = 1;
			
			
			try {
				String refsql = "select max(ref) from information";
				pstmt = con.prepareStatement(refsql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					ref = rs.getInt(1) + 1;
				}
				
				
				String sql = "insert into information values (info_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
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
		
		
		//하나의 게시물을 가져오는 메소드
		public InformationBean getOneInformation(int num) {
			
			InformationBean nbean = null;
			getCon();
			try {
				
				String countSql = "update information set readCount = readCount + 1 where num = ?";
				pstmt = con.prepareStatement(countSql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
				String sql = "select * from information where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
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
							
				}
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return nbean;
		}
		
		//게시물을 수정하는 메소드
		public int updateInformation(int num , String subject , String content) {
			int result = 0;
			getCon();
			try {
				
				String sql = "update information set subject = ? , content = ? where num = ?";
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
		
		
		//게시글 삭제하는 메소드 
		public int deleteInformation(int num) {
			
			int result = 0;
			getCon();
			
			try {
				
				String sql = "delete from information where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
}
