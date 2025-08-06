package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connect.DBConnection;
import model.Booking;

public class BookingsDao {

	public int insert(Booking b) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into bookings(fname,  lname, national_id, gender, mobile_no, check_in) values (?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, b.getFname());
		pstmt.setString(2, b.getLname());
		pstmt.setString(3, b.getCnid());
		pstmt.setInt(4, b.getGender());
		pstmt.setInt(5, b.getMobile());
		pstmt.setDate(6, b.getCheckin());
		int isInsert = pstmt.executeUpdate();
		return isInsert;
	}
	
}
