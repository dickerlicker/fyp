<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>SP Airlines</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="EAD%20CSS.css">
</head>
<body>
<header id="header">
        <p>SP Airlines</p>

        <a href="#popup1" class="button" id="AdminLogin">Login as administrator</a>
        <article id="popup1" class="popup1">

            <a class="close1" href="#">&times;</a>
            <article class="content1">
                <form action="verifyUser.jsp" class="ALogin">
                    <h4>Login as administrator:</h4>
                    <h1>Login ID:</h1><br>
                    <input type="text" name="loginid" class="AdminID" /><br>
                    <h1>Password:</h1>
                    <br>
                    <input type="password" name="password" class="AdminPassword" /><br> <br>
                    <input type="submit" name="btnSubmit" value="Login" class="LoginButton" />
                </form>
            </article>
        </article>

        <nav id="nav">
            <a href="index.html">Home</a>/
            <a href="Flight.html">Flight Details</a>/
            <a href="Support.html">Support</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>

    </header>
    
<article class="searchairplane">

<%
out.print("<table border = 1>");
out.print("<tr><td>Name</td><td> Comment</td></tr>");
String name,comment;
try{
    // Step1: Load JDBC Driver
     Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false&useSSL=false"; 
    // Step 3: Establish connection to URL
    Connection conn = DriverManager.getConnection(connURL);
    // Step 5: Execute SQL Command
	String sqlStr = "SELECT * FROM assignment1.comments;";
          PreparedStatement pstmt = conn.prepareStatement(sqlStr);
          ResultSet rs = pstmt.executeQuery();
          while (rs.next()) {
        	  name = rs.getString("Name");
        	  comment = rs.getString("Comment");
        	  out.print ("<tr><td>"+name+"</td><td>"+comment+"</td></tr>");
          } out.print ("</table>");
          
   
     // STEP 7
    conn.close(); 
}catch (Exception e) {
    }
          %>
          </article>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
    </footer>

</body>
</html>