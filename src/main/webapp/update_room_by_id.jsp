<!DOCTYPE html>
<%@page import="dao.RoomsDao"%>
<%@page import="model.Room" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Room By ID</title>
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
    .btn {
      padding: 8px 15px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .btn:hover {
      background-color: #555;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">Hotel App</div>
    <nav>
      <ul>
        <li><a href="home.html">Home</a></li>
        <li><a href="index.html">Login</a></li>
        <li><a href="#">Register</a></li>
        <li><a href="#">Logout</a></li>
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
  			
  			<table border="2">
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
