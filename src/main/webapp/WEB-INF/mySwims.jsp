<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="shortcut icon" href="images/swimblack.ico">
		<title>SwimPal - Pool List</title>
	</head>
	<body>
		<div class="container-fluid" id="header">
			<form method="POST" action="/">
				<button>
					<h1 class="align-text-middle medLg"><img src="images/swim_white.png">SwimPal</h1>
				</button>
			</form>
			<h5 class="medLg">Swim Seattle Pools Now</h5>
			
			<a href="/"><h1 class="sm"><img src="/images/swim_white.png">SwimPal</h1></a>
		</div>
		<nav class="navbar navbar-dark bg-primary smLog medLog">
			<p class="navbar-brand" id="curTime"> <c:set var = "now" value = "<%= new java.util.Date()%>" />
		 	<img src="images/watchWhite.png">  <fmt:formatDate pattern="h:mm a"  value="${now}" /></p>
		    <a class="navbar-brand" href="/">Home</a>
  			<a class="navbar-brand" href="/pools">Seattle Pools</a>
		    <c:if test="${sessionAttribute != 'noLoggedUser'}">
		    	<div class="logged">
		  			<p class="navbar-brand">Hello <c:out value="${sessionAttribute.firstName}"></c:out>!</p>
		  			<p><a class="navbar-brand-sm" href="/logout">Logout</a><p>
	  			</div>
  			</c:if>
  			
  		</nav>
		<div class="container-fluid table-responsive" id="poolList">
			<h1>My Swims</h1>
			<p style="font-weight:bold; color:red">${log}</p>
			
		    <table class="table table-hover table-dark bg-primary">
		    	<tr>
			    	<th>Pool</th>
			    	<th>Swim</th>
			    	<th>Days</th>
			    	<th>Times</th>
			    	<th>Other Info</th>
			    	<th>Remove from MySwims</th>
			    	
			    </tr>
			    <c:forEach items="${mySchedules}" var = "mySchedule">
			    	
			    	<tr>
			    		<td><a href="/pools/${mySchedule.pool.id}">${mySchedule.pool.name}</a></td>
			    		<td>${mySchedule.swim}</td>
			    		<td>${mySchedule.days}</td>
			    		<td><fmt:formatDate value="${mySchedule.start}" pattern="h:mm a"/> - <fmt:formatDate value="${mySchedule.end}" pattern="h:mm a"/></td>
			    		<td>${mySchedule.note}</td>
			    		<td><a href="/deleteSwim/${mySchedule.id}">Delete</a></td>
			    	
			    	</tr>
			    </c:forEach>
			  </table>

		</div>
		<div class="bg-primary" id="footer">
			<a class="navbar-brand" href="/about">About SwimPal</a>	
			<p>Developed by Sara Roepe</p>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>