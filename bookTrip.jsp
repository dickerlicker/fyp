<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="assignment2.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="EAD%20CSS.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
<link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
        $(function() {
            $('input[name=group1]').on('click init-group1', function() {
                $('#showrd').toggle($('#radio-1').prop('checked'));
            }).trigger('init-group1');
        });
        
        $(function() {
    		$("#departing").datepicker({
    	dateFormat: 'yy-mm-dd'
    		});
    });
    
    $(function() {
		$("#returning").datepicker({
	dateFormat: 'yy-mm-dd'
		});
	});
    </script>
    
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

<form action="PublicSearchServlet" class="publicsearchform" method="post">
		
		Search Origin Country<select name="countryorigin">
		
		<option value="Singapore">Singapore</option>
		<option value="Germany">Germany</option>
		<option value="Japan">Japan</option>
		<option value="Vietnam">Vietnam</option>
		<option value="Taiwan">Taiwan</option>
		<option value="South Korea">South Korea</option>
		<option value="England">England</option>
		<option value="Australia">Australia</option>
		</select>
		<br>
		
		Search Destination Country<select name="countrydestination">
		
		<option value="Singapore">Singapore</option>
		<option value="Germany">Germany</option>
		<option value="Japan">Japan</option>
		<option value="Vietnam">Vietnam</option>
		<option value="Taiwan">Taiwan</option>
		<option value="South Korea">South Korea</option>
		<option value="England">England</option>
		<option value="Australia">Australia</option>
		</select>
		<br>
		Select Date of Departure Flight: <input type="text" name="dateofdeparture" id="departing" required>
		<br>
		<div id="showrd">
		Select Date of Return Flight: <input type="text" name="dateofarrival" id="returning">
		</div>
		<br>
		
		Number of Adults: (Maximum 10) <input type="number" name="adultnumber" min="1" max="10" value="1"><br>
		
		<br>Select Class<select name="seatclass">
		<option value="economy_capacity">Economy Class</option>
		<option value="business_capacity">Business Class</option>
		<option value="firstclass_capacity">First Class</option>
		</select>
		
		<br>
	<section id="radiobutton" class="flightradio">
    	<div class="container">
    		<input type="radio" name="group1" id="radio-1" value="return" checked>
			<label for="radio-1"><span class="radio">Return</span></label>
        	<input type="radio" name="group1" id="radio-2" value="oneway">
            <label for="radio-2"><span class="radio">One way</span></label>
		</div>
    </section>
	<input type="submit" name="btnSubmit" value="search available flights"/>
	
</form>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>
        </div>
        
</footer>

</body>
</html>