<!DOCTYPE html>
<%@page import="dao.AdminDao"%>
<html lang="en">

<%
	String admin = (String) session.getAttribute("username");
	if(admin==null) {
		response.sendRedirect("index.html");
	}
%>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Register Page</title>
  <link rel="stylesheet" href="css/register.css" />
</head>
<body>

  <section class="login-section" id="login">
    <h2>Register</h2>
    <form class="login-form" action="admin_register.jsp" method="post">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required />

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required />

      <button type="submit">Register</button>
    </form>
  </section>

	<%
	
		String uname = request.getParameter("username");
    	String password = request.getParameter("password");
    		  
    	if(uname!=null && password!=null) {
    		AdminDao adao = new AdminDao();
    		boolean isPresent = adao.checkRegister(uname);
    		if(isPresent) {
    			out.println("<center><h3>Username Already Registerd</center></h3>");
    		}
    		else {
    			int i = adao.insert(uname, password);
    			if(i>0) {
    				out.println("<center><h3>Record Inserted Successfully</center></h3>");
    			}
    			else {
    				out.println("<center><h3>Record Not Inserted</center></h3>");
    			}
    		}
    	}
	%>

</body>
</html>
