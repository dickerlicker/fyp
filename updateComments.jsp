<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
you shouldnt be seeing this!

<%
String Name = request.getParameter("name");
String Email = request.getParameter("email");
String Comment = request.getParameter("message");

try{
    // Step1: Load JDBC Driver
     Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false"; 
    // Step 3: Establish connection to URL
    Connection conn = DriverManager.getConnection(connURL);
    // Step 5: Execute SQL Command

    String sqlStr = "INSERT INTO `assignment1`.`comments`  (`Email`, `Name`, `Comment`) VALUES ('"+Email+"', '"+Name+"', '"+Comment+"');";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.executeUpdate();
    
    	response.sendRedirect("Support.html");
     // STEP 7
    conn.close(); 
}catch (Exception e) {
    }

%>



</body>
</html>