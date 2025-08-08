<!DOCTYPE html>
<%@page import="dao.RoomsDao"%>
<%@page import="model.Room" %>
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
  <title>Search By ID</title>
  <link rel="stylesheet" href="css/search_by_id.css">
</head>
<body>

  <header>
    <div class="logo">Hotel App</div>
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
    <h2>Search Room by ID</h2>
    <form class="search-form">
      <input type="text" name="id" placeholder="Enter ID" required>
      <button type="submit">Search</button>
    </form>
  </div>
  
  <%
  	String idstr = request.getParameter("id");
  	if(idstr!=null) {
  		int id = Integer.parseInt(idstr);
  		
  		RoomsDao rdao = new RoomsDao();
  		
  		Room r = rdao.searchById(id);
  		
  		if(r==null) {
  			out.println("<center><h1>Record Not Found");
  		}
  		else {
  			%>
  			
  			<table>
  				<tr>
  					<th>Room id</th>
  					<td><%= r.getR_id() %></td>
  				</tr>
  				<tr>
  					<th>Room Type</th>
  					<td><%= r.getR_type()%></td>
  				</tr>
  				<tr>
  					<th>Room Price</th>
  					<td><%= r.getR_price() %></td>
  				</tr>
  				<tr>
  					<th>Room Status</th>
  					<td><% 
	
  					if(r.getR_status()==0) {
  						out.println("Not Available");
  					}
  					else {
  						out.println("Available");
  					}	
  					
  					%></td>
  				</tr>
  			</table>
  			
  			<%
  		}
  		
  	}
  %>

</body>
</html>
