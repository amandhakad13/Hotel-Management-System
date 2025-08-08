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
import java.sql.Connection;
import java.sql.SQLException;

import dao.RoomsDao;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/insert")
public class InsertServlet extends HttpServlet {
	Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strRno = request.getParameter("r_no");
		int r_no = Integer.parseInt(strRno);
		String type = request.getParameter("type");
		String strPrice = request.getParameter("price");
		int price = Integer.parseInt(strPrice);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Room r = new Room();
		RoomsDao rdao = new RoomsDao();
		
		r.setR_id(r_no);
		r.setR_type(type);
		r.setR_price(price);
		r.setR_status(1);
		
		try {
			int isInsert = rdao.insert(r);
			if(isInsert>0) {
				RequestDispatcher rs = request.getRequestDispatcher("insert.jsp");
				rs.include(request, response);
				out.println("<center><h2 style='color:white'>Record Inserted Successfully</center></h1>");
			}
			else {
				out.println("<center><h2>Record Not Inserted</center></h2>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
