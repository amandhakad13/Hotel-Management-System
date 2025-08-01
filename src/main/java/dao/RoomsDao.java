package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connect.DBConnection;
import model.Room;

public class RoomsDao {
	
	public int insert(Room r) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "insert into rooms(r_id, r_type, r_price, r_status) values (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, r.getR_id());
		pstmt.setString(2, r.getR_type());
		pstmt.setInt(3, r.getR_price());
		pstmt.setInt(4, 1);
		int isInsert = pstmt.executeUpdate();
		return isInsert;
	}
	
	public Room searchById(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from rooms where r_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			Room r = new Room();
			
			r.setR_id(rs.getInt(1));
			r.setR_type(rs.getString(2));
			r.setR_price(rs.getInt(3));
			r.setR_status(rs.getInt(4));
			
			return r;
		}
		
		return null;
	}
	
	public List<Room> getAll() throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from rooms";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		List<Room> ls = new ArrayList<>();
		
		while(rs.next()) {
			Room r = new Room();
			
			r.setR_id(rs.getInt(1));
			r.setR_type(rs.getString(2));
			r.setR_price(rs.getInt(3));
			r.setR_status(rs.getInt(4));
			
			ls.add(r);
			r = null;
		}
		
		return ls;
	}
	
	
	
	public void delete(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "delete from rooms where r_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		pstmt.executeUpdate();
	}
	
	
	
	public String searchRoomTypeByBookingId(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select r_type from rooms where r_id = (select room_id from customer where c_id = ?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		String type = null;
		if(rs.next()) {
			type = rs.getString(1);
		}
		return type;
	}
	
	public int totalIncomeByRoomId(int id) throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select count(room_id)*(select r_price from rooms where r_id = ?) from customer where room_id = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		pstmt.setInt(2, id);
		ResultSet rs = pstmt.executeQuery();
		int type = 0;
		if(rs.next()) {
			type = rs.getInt(1);
		}
		return type;
	}
}
