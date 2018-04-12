<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.sql.*"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
          
<%
String user = request.getParameter("loginid");
String pwd = request.getParameter("password");

try{
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false";
		String login = "SELECT * FROM assignment1.login WHERE userid=? AND password=?";
		Connection conn = DriverManager.getConnection(connURL);
		PreparedStatement pstmt = conn.prepareStatement(login);
		pstmt.setString(1, user);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		
	
		if ( rs.next()) { 
		   session.setAttribute("login-status", "YES");
		   response.sendRedirect("admin.jsp");	  
		}
		else { 
		   response.sendRedirect("index.html"); // Brings user to another webpage
		}

		conn.close();
} catch (Exception e) {
	  System.err.println("Error :" + e);
	}
%>
          
          
        


</body>
</html>