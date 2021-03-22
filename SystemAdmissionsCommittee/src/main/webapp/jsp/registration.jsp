<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="AnD_FLuX">
<title>Create an account</title>

	<link rel="shortcut icon" href="images/favicon.png" type="image/png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="container">
		<header>
			<h1>
			<img src="images/logo.png"	alt="Admissions Committee">
			</h1>
		</header>
		<h1 class="text-center">Register</h1>

		<form:form method="POST" modelAttribute="userForm" class="registration-form" id="reg_form">
		
		<spring:bind path="firstName">
				<label class="col-one-half"> 
					<span class="label-text">First Name</span> 
					<form:input type="text" path="firstName" name="firstName" required="true"></form:input>
					<form:errors path="firstName"></form:errors>
				</label> 	
		</spring:bind>
			
			
		<spring:bind path="lastName">	
				<label class="col-one-half">
					<span class="label-text">Last Name</span> 
					<form:input type="text"  path="lastName" name="lastName" required="true"></form:input>
					<form:errors path="lastName"></form:errors>
				</label> 		
		</spring:bind>			
				
					
		<spring:bind path="email">			
				<label> 
					<span class="label-text">Email</span> 
					<form:input	type="text" path="email" name="email" required="true"></form:input>
					<form:errors path="email"></form:errors>	
				</label> 			
		</spring:bind>	
			
		
		<spring:bind path="password">
         		<label class="password"> 
					<span class="label-text">Password</span>
					<form:input id="t1" type="password" path="password" name="password" required="true" minlength="8"></form:input>
					<form:errors path="password"></form:errors>
				</label>
		</spring:bind>	
			
		<spring:bind path="passwordConfirm">	
			 	<label class="password"> 
			 		<span id="t3" class="label-text">Password confirm</span> 
			 		<form:input id="t2" type="password" path="passwordConfirm" name="passwordConfirm" required="true" minlength="8"></form:input>
            		<form:errors path="passwordConfirm"></form:errors>
				</label>
        </spring:bind>


			<div class="text-center marg-tp">
				<button type="submit" class="submit" name="submit">Sign Me Up</button>
			</div>
			
			<h5 class="text-center marg-tp"><a href="${contextPath}/login">Back to LogIn</a></h5>
			
		 </form:form>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
</body>
</html>