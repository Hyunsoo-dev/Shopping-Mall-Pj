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
	
	
	//차량 예약하기를 눌렀을 때 DB에 데이터들을 저장하는 메소드
	public void setReserve(CarReserveBean rbean) {
		
		getCon();
		
		
		try {
			
			
			String sql = "insert into carreserve values(reserve_seq.nextval,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,rbean.getNo());
			pstmt.setString(2, rbean.getId());
			pstmt.setInt(3, rbean.getQuantity());
			pstmt.setInt(4, rbean.getRentDuration());
			pstmt.setString(5, rbean.getRentDate());
			pstmt.setInt(6, rbean.getInsurance());
			pstmt.setInt(7, rbean.getWifi());
			pstmt.setInt(8, rbean.getNavigation());
			pstmt.setInt(9, rbean.getBabySheet());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
	
	public Vector<CarViewBean> getAllview(String id){
		Vector<CarViewBean> v = new Vector<CarViewBean>();
		CarViewBean cbean = null;
		
		getCon();
		
		try {
			
			String sql =  "select a2.img,  a2.name, a1.quantity , a2.price , a1.rentduration , a1.rentdate, a2.usepeople, a1.insurance, a1.Wifi, a1.Navigation, a1.BabySheet, a2.company , a1.no"
						+ " from carreserve a1 , rentcar a2 "	
						+ "where sysdate < to_date(rentdate , 'yyyy-MM-dd') and a1.no = a2.no and id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cbean = new CarViewBean();
				cbean.setImg(rs.getString(1));
				cbean.setName(rs.getString(2));
				cbean.setQuantity(rs.getInt(3));
				cbean.setPrice(rs.getInt(4));
				cbean.setRentDuration(rs.getInt(5));
				cbean.setRentDate(rs.getString(6));
				cbean.setUsePeople(rs.getInt(7));
				cbean.setInsurance(rs.getInt(8));
				cbean.setWifi(rs.getInt(9));
				cbean.setNavigation(rs.getInt(10));
				cbean.setBabySheet(rs.getInt(11));
				cbean.setCompany(rs.getString(12));
				cbean.setNo(rs.getInt(13));
				v.add(cbean);
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return v;
	}
	
	//예약 목록을 삭제하는 메소드 
	public void carReserveDelete(int no) {
		int result = 0;
		getCon();
		
		try {
			
			String sql = "delete from carreserve where no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
 
