<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="EAD%20CSS.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
<h1> Payment </h1>
<!-- 
The payment webpage will display the booking summary including the price, flight number, number of tickets, departure date,
departure time, arrival date, arrival time (still unsure if need to do more details). Then it will prompt the user for the
payment information such as name, credit card number, expiration date, cvv number, country, city, state, billing address, postal code.
Then, it will then store the information collect into a payment table.
 -->
<%

%>

<form action="paymentServlet" method="post">
	Title: <select name="Ptitle">
			<option value="Mr">Mr</option>
			<option value="Ms">Ms</option>
			<option value="Dr">Dr</option>
		</select><br>
	Name: <input type="text" name="Pname"><br>
	Email: <input type="email" name="Pemail"><br>
	Contact Number: <input type="text" name="PcontactNo"><br>
	Credit card number: <input type="text" name="ccNo"><br>
	Expiration date: <input type="date" name="expiryDate"><br>
	CVV number: <input type="text" name="cvv"><br>
	Country: <input type="text" name="country"><br>
	City: <input type="text" name="city"><br>
	State: <input type="text" name="state"><br>
	Billing address: <input type="text" name="billingAddress"><br>
	Postal Code: <input type="text" name="postalCode"><br>
<input type="submit" value="submit">
<!-- 
Display the Summarized flight summary booking summary thingy.
 -->
</form>
</body>
</html>