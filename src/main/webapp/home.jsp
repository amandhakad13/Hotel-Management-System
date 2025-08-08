<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Admin-Dashboard</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
    <!-- Header -->
    <header class="navbar">
        <div class="logo">Hotel</div>
        <nav>
            <ul>
                <li><a href="home.jsp" class="active">Home</a></li>
                <li><a href="admin_register.jsp">Register</a></li>
                <li><a href="logout">Logout</a></li>
                <li class="uname"><%= admin %></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Welcome to Hotel Management Application</h1>
        <p>Manage your records easily with these actions</p>
        <div class="action-buttons">
            <a href="insert.jsp" class="btn">Insert</a>
            <a href="search_by_id.jsp" class="btn">Search by ID</a>
            <a href="display_all_room.jsp" class="btn">Display All</a>
            <a href="update_room_by_id.jsp" class="btn">Update</a>
            <a href="delete_room_by_id.jsp" class="btn">Delete</a>
            <a href="book_room.jsp" class="btn">Book Room</a>
        </div>
    </section>
</body>
</html>
 