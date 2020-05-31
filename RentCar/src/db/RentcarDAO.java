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
	
	
	
	//Ŀ�ؼ� Ǯ�� �̿��� �����ͺ��̽� ���� 
	
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
	
	//�ֽż� 3���� �ڵ����� �����ϴ� �޼ҵ� 
	public Vector<CarListBean> getSelectCar(){
		
		//����Ÿ�� ���� 
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
					break; //count�� 3�̻��̸� �ݺ����� ���������ÿ�.
				
				
				
				
			}
			
			con.close();
						
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return v;
	}
	
	//ī���ڸ� �� �ڵ��� ����Ʈ�� �����ϴ� �޼ҵ� 
	public Vector<CarListBean> getCategoryCar(int category){
		
		Vector<CarListBean> v = new Vector<CarListBean>();
		
		//�����͸� ���� �� ��Ŭ���� ����
		CarListBean bean = null;
		
		getCon();
		
		try {
			//���� �غ�
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
	
	
	//��� ������ �˻��ϴ� �޼ҵ� ���� 
	public Vector<CarListBean> getAllCar(){
Vector<CarListBean> v = new Vector<CarListBean>();
		
		//�����͸� ���� �� ��Ŭ���� ����
		CarListBean bean = null;
		
		getCon();
		
		try {
			//���� �غ�
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
	
	//�ϳ��� �ڵ��� ������ �����ϴ� �޼ҵ�
	public CarListBean getOneCar(int no) {
		
		//����Ÿ�� ����
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
	
	//ȸ�� ������ Ȯ���ϴ� �α��� �޼ҵ�
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
 
