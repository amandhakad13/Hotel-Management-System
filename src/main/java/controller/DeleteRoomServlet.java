package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import dao.RoomsDao;

/**
 * Servlet implementation class DeleteRoomServlet
 */
@WebServlet("/delete")
public class DeleteRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		String idstr = request.getParameter("rid");
		int id = Integer.parseInt(idstr);
		
		RoomsDao rdao = new RoomsDao();
		
		try {
			int delete = rdao.delete(id);
			if(delete>0) {
				RequestDispatcher rs = request.getRequestDispatcher("delete_room_by_id.jsp");
				rs.include(request, response);
				pw.println("<center><h3 style='color:white'>Record Deleted</h3></center>");
			}
			else {
				pw.println("<center><h3>Record Not Deleted</h3></center>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
