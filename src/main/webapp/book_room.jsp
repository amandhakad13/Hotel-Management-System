<%@page import="model.Booking"%>
<%@page import="dao.BookingsDao"%>
<%@page import="dao.AdminDao"%>
<%@page import="java.sql.Date" %>

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest Registration</title>
    <link rel="stylesheet" href="css/book_room.css">
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

<section class="registration-section">
    <h2>Guest Registration</h2>
    <form class="registration-form" action="book_room.jsp" method="post">
        
        <div class="form-row">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
        </div>

        <div class="form-group">
            <label for="nationalId">National ID</label>
            <input type="text" id="nationalId" name="nationalId" required>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="1">Male</option>
                    <option value="-1">Female</option>
                    <option value="0">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="tel" id="mobile" name="mobile" required>
            </div>
        </div>

        <div class="form-group">
            <label for="checkinDate">Check-in Date</label>
            <input type="text" placeholder="YYYY-MM-DD" id="checkinDate" name="checkinDate" required>
        </div>
        
        <div class="form-group">
            <label for="roomId">Room No</label>
            <input type="text" id="roomId" name="roomId" required>
        </div>

        <button type="submit">Register Guest</button>
    </form>
</section>

<%
	
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String nationalId = request.getParameter("nationalId");
	String gender = request.getParameter("gender");
	String mobile = request.getParameter("mobile");
	String checkinDate = request.getParameter("checkinDate");
	String roomId = request.getParameter("roomId");
	
	if(firstName != null && lastName != null && nationalId != null && 
	   gender != null && mobile != null && checkinDate != null && roomId!= null) {
	  	
	   int gender1 = Integer.parseInt(gender); 	
	   Date date = java.sql.Date.valueOf(checkinDate);
	   int id = Integer.parseInt(roomId);
	   int mobile1 = Integer.parseInt(mobile);
	  
	   BookingsDao bdao = new BookingsDao();
	   Booking b = new Booking();
	   
	   b.setFname(firstName);
	   b.setLname(lastName);
	   b.setCnid(nationalId);
	   b.setGender(gender1);
	   b.setMobile(mobile1);
	   b.setCheckin(date);
	   
	   int i = bdao.insert(b, id);
	   
	   if(i>0) {
		   %>
		   <h2>
		   <% 
		   out.println("Room Booked");
		   %>
		   </h2>
		   <%
		   bdao.updateStatus(0, id);
	   }
	   else {
		   out.println("not success");
	   }
	}
%>

</body>
</html>