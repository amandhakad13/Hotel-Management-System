<!DOCTYPE html>
<html lang="en">

<%
	String admin = (String) session.getAttribute("username");
	if(admin==null) {
		response.sendRedirect("index.html");
	}
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Room Insert Page</title>
  <link rel="stylesheet" href="css/insert.css">
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

  <section class="login-section" id="login">
    <h2>Insert</h2>
    <form class="login-form" action="insert" method="post">
      <label>Room No</label>
      <input type="text" id="username" name="r_no" required />

      <label>Room Type</label>
      <input type="text" id="password" name="type" required />
      
      <label>Room Price</label>
      <input type="text" id="password" name="price" required />

      <button type="submit">Submit</button>
    </form>
  </section>

</body>
</html>
