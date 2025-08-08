package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import dao.RoomsDao;

/**
 * Servlet implementation class UpdateRoom
 */
@WebServlet("/update")
public class UpdateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		String idstr = request.getParameter("id");
		String pricestr = request.getParameter("price");
		String type = request.getParameter("type");
		int price = Integer.parseInt(pricestr);
		int id = Integer.parseInt(idstr);
		
		Room r = new Room();
		r.setR_id(id);
		r.setR_type(type);
		r.setR_price(price);
		
		RoomsDao rdao = new RoomsDao();
		
		try {
			int delete = rdao.update(r);
			if(delete>0) {
				RequestDispatcher rs = request.getRequestDispatcher("update_room_by_id.jsp");
				rs.include(request, response);
				pw.println("<center><h3 style='color:white'>Record Updated</h3></center>");
			}
			else {
				pw.println("<center><h3>Record Not Updated</h3></center>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
