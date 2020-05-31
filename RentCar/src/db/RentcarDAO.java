package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;

public class RentcarDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	
	//커넥션 풀을 이용한 데이터베이스 연결 
	
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
	
	//최신순 3대의 자동차를 리턴하는 메소드 
	public Vector<CarListBean> getSelectCar(){
		
		//리턴타입 설정 
		Vector<CarListBean> v = new Vector<CarListBean>();
		getCon();
		
		try {
			
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0 ;
			
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				v.add(bean);				
				
				count++;
				
				if(count > 2) 
					break; //count가 3이상이면 반복문을 빠져나가시오.
				
				
				
				
			}
			
			con.close();
						
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return v;
	}
	
	//카테코리 별 자동차 리스트를 저장하는 메소드 
	public Vector<CarListBean> getCategoryCar(int category){
		
		Vector<CarListBean> v = new Vector<CarListBean>();
		
		//데이터를 저장 할 빈클래스 선언
		CarListBean bean = null;
		
		getCon();
		
		try {
			//쿼리 준비
			String sql = "select * from rentcar where category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
				
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	//모든 차량을 검색하는 메소드 설정 
	public Vector<CarListBean> getAllCar(){
Vector<CarListBean> v = new Vector<CarListBean>();
		
		//데이터를 저장 할 빈클래스 선언
		CarListBean bean = null;
		
		getCon();
		
		try {
			//쿼리 준비
			String sql = "select * from rentcar";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
				
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//하나의 자동차 정보를 리턴하는 메소드
	public CarListBean getOneCar(int no) {
		
		//리턴타입 선언
		CarListBean bean = new CarListBean();
		getCon();
		
		try {
			String sql = "select * from rentcar where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				
			}
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//회원 정보를 확인하는 로그인 메소드
	public int getLogin(String id, String pass) {
		
		int result = 0;
		getCon();
		try {
			
			String sql = "select count(*) from member where id = ? and pass1 = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			result = pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
 
