package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connect.DBConnection;

public class AdminDao {
	
	public boolean checkRegister(String username) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from admins where username=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, username);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())
			return true;
		else
			return false;
	}
	
	public int insert(String uname, String password) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into admins(username, password) values (?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, uname);
		pstmt.setString(2, password);
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
}
