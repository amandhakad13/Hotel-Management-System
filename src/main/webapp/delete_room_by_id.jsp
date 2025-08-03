<!DOCTYPE html>
<%@page import="dao.RoomsDao"%>
<%@page import="model.Room" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete By ID</title>
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
    
    .bt {
      position: absolute;
   	  top: 78%;
      left: 50%;
      transform: translate(-50%, -50%); 
      padding: 10px 15px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
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
    <h2>Delete Room by ID</h2>
    <form class="search-form" action="delete_room_by_id.jsp" method="post">
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
  					<td><%= r.getR_status() %></td>
  				</tr>
  			</table>
  			
  			<!-- <form action="delete" method="post">
  				<button class="bt" type="submit">Confirm</button>
  			</form> -->
  			<a href="delete?rid=<%=r.getR_id() %>"><button class="bt">Confirm</button></a>
  			<%
  		}
  		
  	}
  %>

</body>
</html>
