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
  <title>Update Room By ID</title>
  <link rel="stylesheet" href="css/update_room.css">
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
    <h2>Update Room by ID</h2>
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
  			<form action="update" method="post">
  				<tr>
  					<th>Room Id</th>
  					<td><input type="text" value="<%= r.getR_id() %>" name="id" required></td>
  				</tr>
  				<tr>
  					<th>Room Type</th>
  					<td><input type="text" value="<%= r.getR_type() %>" name="type" required></td>
  				</tr>
  				<tr>
  					<th>Room Price</th>
  					<td><input type="text" value="<%= r.getR_price() %>" name="price" required></td>
  				</tr>
  				<tr>
  					<th>Click To Update</th>
  					<td><button class="btn" type="submit">Update</button></td>
  				</tr>
  				</form>
  			</table>
  			
  			<%
  		}
  		
  	}
  %>

</body>
</html>
