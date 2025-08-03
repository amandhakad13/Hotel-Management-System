<!DOCTYPE html>
<%@page import="dao.RoomsDao"%>
<%@page import="model.Room" %>
<%@page import="java.util.List" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Display Rooms</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .search-section {
      background-color: #fff;
      padding: 40px 20px;
      max-width: 500px;
      margin: 60px auto;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      text-align: center;
    }
    .search-section h2 {
      margin-bottom: 20px;
      color: #333;
    }
    .search-form {
      display: flex;
      justify-content: center;
      gap: 10px;
    }
    .search-form input {
      padding: 10px;
      width: 200px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .search-form button {
      padding: 10px 15px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .search-form button:hover {
      background-color: #555;
    }
    
    table {
    	margin: auto;
    }
    
    td, th {
    	width: 200px;
    	height: 40px;
    	
    }
    
    td {
    	text-align: center;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">Hotel App</div>
    <nav>
      <ul>
        <li><a href="home.html">Home</a></li>
        <li><a href="admin_register.jsp">Register</a></li>
        <li><a href="logout">Logout</a></li>
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
  			<table border="2">
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
  					<td><%= l.getR_status() %></td>
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