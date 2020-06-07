package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ClientDAO {
	
	
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//Ŀ�ؼ� Ǯ�� �̿��� ������ ���̽� ���� 
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
	
	
	
	//ȸ������ �޼ҵ� 
	public int ClientJoin(ClientBean tbean) {
		int result = 0;
		
		if(checkId(tbean) == 0) {//�ߺ��� ���
			result = 0;
			return result;
		}
		
		getCon();
		
		try {	
				
				String sql = "insert into client values (?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tbean.getId());
				pstmt.setString(2, tbean.getName());
				pstmt.setString(3, tbean.getPassword());
				pstmt.setString(4, tbean.getEmail());
				
				result = pstmt.executeUpdate();
				
				
			
			con.close();
					
		} catch (Exception e) {
			
			e.printStackTrace();
		}
			return result;
		
	}
	
	//client ���� �������� �޼ҵ�
	public ClientBean getClientInfo(String id) {
	
		ClientBean tbean = null;
		getCon();
		
		try {
			String sql = "select * from client where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tbean = new ClientBean();
				tbean.setId(rs.getString(1));
				tbean.setName(rs.getString(2));
				tbean.setPassword(rs.getString(3));
				tbean.setEmail(rs.getString(4));
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tbean;
		
	}

	
	//ȸ������ �� �ߺ��� ���̵� üũ 
	public int checkId(ClientBean tbean) {
		
		int result = 0;
		
		getCon();
		
		try {
			
			while(true) {
				//�ߺ��� ���̵� ���� üũ
				
				String sql = "select * from client where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tbean.getId());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					result = 0;//�ߺ�
					
				}else 
					result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	
}
