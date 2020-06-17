package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;



public class movieDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public void getCon() {
		
		
	try {
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver";
	
		Class.forName(driver);
		con = DriverManager.getConnection(url, id, pw);
				
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}
	
	//영화 리스트 입력하기
	public void setMovie(movieBean ebean){
		
		getCon();
		try {
			
			String sql = "insert into movie values (movie_seq.nextval,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ebean.getName1());
			pstmt.setString(2, ebean.getImg());
			pstmt.setString(4, ebean.getMakingYear());
			pstmt.executeUpdate();
			
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	//영화 리스트 가져오기 
	
	public Vector<movieBean> getMovieList(String movieName){
		
		getCon();
		Vector<movieBean> v = new Vector<movieBean>();
		movieBean ebean = null;
		try {
			
			String sql = "select * from movie where name1 like ?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ebean = new movieBean();
				ebean.setNo(rs.getInt(1));
				ebean.setName1(rs.getString(2));
				ebean.setImg(rs.getString(3));
				ebean.setRealImg(rs.getString(4));
				ebean.setMakingYear(rs.getString(5));
				
				v.add(ebean);
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
}
