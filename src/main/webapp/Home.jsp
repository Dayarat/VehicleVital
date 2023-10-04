<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/home.css">
<title>Insert title here</title>
</head>
<body>
	<section id="home">
	
	<div class="navbar">
        <a href="#home">Home</a>
        <a href="#serviceform">About</a>
        <a href="#services">Contact</a>
        <h1>Home</h1>
        
    </div>
    <div class="content">
        <h1>Contact Information</h1>
        <table>
            <tr>
                <th>Name</th>
                <td>John Doe</td>
                
                
            </tr>
            <tr>
                <th>Email</th>
                <td>john@example.com</td>
                
            </tr>
            <tr>
            	<th>Contact No.</th>
            	<td>123-456-7890</td>
            </tr>
        </table>
        
        <button class="logoutbtn">Logout</button>
    </div>
    
    
	</section>
	<section id="serviceform">
	<h1>ServicesForm</h1>
	<div class="container">
        <h1>Contact Form</h1>
        <form action="#" method="post">
            <div class="form-group">
                <label for="location">Location:</label>
                <select id="location" name="location">
                    <option selected>Choose...</option>
						    <option value="Colombo">Colombo</option>
				            <option value="Gampaha">Gampaha</option>
				            <option value="Kalutara">Kalutara</option>
				            <option value="Kandy">Kandy</option>
				            <option value="Matale">Matale</option>
				            <option value="Nuwara Eliya">Nuwara Eliya</option>
				            <option value="Galle">Galle</option>
				            <option value="Matara">Matara</option>
				            <option value="Hambantota">Hambantota</option>
				            <option value="Jaffna">Jaffna</option>
				            <option value="Kilinochchi">Kilinochchi</option>
				            <option value="Mannar">Mannar</option>
				            <option value="Vavuniya">Vavuniya</option>
				            <option value="Mullaitivu">Mullaitivu</option>
				            <option value="Batticaloa">Batticaloa</option>
				            <option value="Ampara">Ampara</option>
				            <option value="Trincomalee">Trincomalee</option>
				            <option value="Kurunegala">Kurunegala</option>
				            <option value="Puttalam">Puttalam</option>
				            <option value="Anuradhapura">Anuradhapura</option>
				            <option value="Polonnaruwa">Polonnaruwa</option>
				            <option value="Badulla">Badulla</option>
				            <option value="Monaragala">Monaragala</option>
				            <option value="Ratnapura">Ratnapura</option>
				            <option value="Kegalle">Kegalle</option>
                </select>
            </div>
            <div class="form-group">
                <label for="mileage">Mileage:</label>
                <input type="text" id="mileage" name="mileage">
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date">
            </div>
            <div class="form-group">
                <label for="time">Time:</label>
                <input type="time" id="time" name="time">
            </div>
            <div class="form-group">
                <label for="vehicle">Vehicle Type:</label>
                <select id="vehicle" name="vehicle">
                    <option selected>Choose...</option>
						    <option value="AAA-001"> Suzuki-WagonR(2015)</option>
						    <option value="ABC-002">Toyota-Prius(2012)</option>
						    <option value="FG-034">Suzuki-Alto(2019)</option>
						    <option value="QA-004">Dolphin(2011) </option>
						    <option value="CAT-005">Honda-Fit(2020) </option>
                </select>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4"></textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
    
     <% 
    // Database connection parameters
    String url = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
    String username = "isec";
    String password = "EUHHaYAmtzbv";
    
    String location = request.getParameter("location");
    String mileageStr = request.getParameter("mileage");
    String vehicle_no = request.getParameter("vehicle");
    String message = request.getParameter("message");
    String userName = "Kavindu"; //request.getParameter("usernameField");
    String dateStr = request.getParameter("date");
    String timeStr = request.getParameter("time");
    
    Connection conn = null;
    
    if(location != null){
	    try {
	        // Establish the database connection
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(url, username, password);
	        
	        // Create SQL statement to insert data
	        String sql = "INSERT INTO vehicle_service (date, time, location, mileage, vehicle_no, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)";;
	        PreparedStatement statement = conn.prepareStatement(sql);
	        statement.setString(1, dateStr);
	        statement.setString(2, timeStr);
	        statement.setString(3, location);
	        statement.setString(4, mileageStr);
	        statement.setString(5, vehicle_no);
	        statement.setString(6, message);
	        statement.setString(7, userName);
	        
	        // Execute the SQL statement
	        statement.executeUpdate();
	        
	        out.println("Data inserted successfully!");
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("Error: " + e.getMessage());
	      
	    } finally {
	        try {
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	        }
	    }
    }
    %>
    
	</section>
	
	<section id="services">
	<h1>Services</h1>
	<div class="container">
        <h1>Booking Details</h1>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Mileage</th>
                    <th>Vehicle Number</th>
                    <th>Message</th>
                </tr>
            </thead>
            <%
      
        
       ;
        ResultSet rs = null;
        
        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            
            // Create a SQL statement
          
            // Execute a query to retrieve booking data
            String sql = "SELECT * FROM vehicle_service WHERE username = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "Kavindu"); // Use setString to set the parameter value
			rs = stmt.executeQuery();
            if (rs.next()) {
            // Iterate through the result set and display data in the table
            while (rs.next()) {
                int bookingId = rs.getInt("booking_id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String location1 = rs.getString("location");
                String mileage = rs.getString("mileage");
                String vehicleNumber = rs.getString("vehicle_no");
                String message1 = rs.getString("message");
        %>
                <tr>
                    <td><%= bookingId %></td>
                    <td><%= date %></td>
                    <td><%= time %></td>
                    <td><%= location1 %></td>
                    <td><%= mileage %></td>
                    <td><%= vehicleNumber %></td>
                    <td><%= message1 %></td>
                </tr>
        <%
        conn.close();
            }}
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            }
        }
        %>
        </table>
    </div>
	</section>
</body>
</html>