<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.DBConnection"%>
<%@page import="dao.RoomsDao"%>
<%@page import="model.Room" %>
<%@page import="java.util.List" %>
<html lang="en">

<%
	String admin = (String) session.getAttribute("username");
	if(admin==null) {
		response.sendRedirect("index.html");
	}
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Display Rooms</title>
  <link rel="stylesheet" href="css/display_all.css">
</head>
<body>

  <header>
    <div class="logo">Hotel</div>
    <nav>
      <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="admin_register.jsp">Register</a></li>
        <li><a href="logout">Logout</a></li>
        <li class="uname"><%= admin %></li>
      </ul>
    </nav>
  </header>

  <div class="search-section">
    <h2>Display Rooms</h2>
    
    <%
  		RoomsDao rdao = new RoomsDao();
  		
  		List<Room> ls = rdao.getAll();
  		
  		if(ls==null) {
  			out.println("<h1><center>Record Not Found</center></h1>");
  		}
  		
  		else {
  			%>
  			<table>
  			<tr>
  				<th>Room Id</th>
  				<th>Room Type</th>
  				<th>Room Price</th>
  				<th>Room Status</th>
  			</tr>	
  			<%
  			
  			for(Room l: ls) {
  				%>
  				<tr>
  					<td><%= l.getR_id() %></td>
  					<td><%= l.getR_type() %></td>
  					<td><%= l.getR_price() %></td>
  					<td><%
  					
  					if(l.getR_status()==0) {
  						out.println("Not Available");
  					}
  					else {
  						out.println("Available");
  					}
  						
  					%></td>
  				</tr> 				
  				<%
  			}
  			%>
  			</table>
  			<%
  	}
  %>
    
  </div>

</body>
</html>