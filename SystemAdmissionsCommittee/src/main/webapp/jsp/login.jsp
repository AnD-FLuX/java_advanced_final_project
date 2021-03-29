<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="AnD_FLuX">
    <title>Log in with your account</title>
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
		
		
	<h1 class="text-center">Welcome</h1>
    <form method="POST" action="${contextPath}/login" class="registration-form">
 

        <div class="form-group ${error != null ? 'has-error' : ''}">
              
            <div class="text-center">   	
            <span class="label-text">${message}</span>
            </div>
                
            <label>
            <span class="label-text marg-tp"><spring:message code='email'/></span> 
            <input name="email" type="text" name="email" required />
            
            </label> 
            
            <label>
            <span class="label-text"><spring:message code='password'/></span> 
            <input name="password" type="password" name="password" required />
            </label> 
            
            <div class="text-center">            
            <span>${error}</span>
            </div>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<div class="text-center marg-tp">
            	<button type="submit" class="submit" type="submit"><spring:message code='login.login'/></button>
            </div>
            	
			
         	<h5 class="text-center marg-tp"><a href="${contextPath}/registration"><spring:message code='login.create_account'/></a></h5>
         	<div class="text-center marg-tp">
				<fieldset>
					<p><spring:message code="login.choose_language" /></p> 
						<select	id="locales">
							<option value="en"><spring:message code='login.english'/></option>
							<option value="uk"><spring:message code='login.ukrainian'/></option>
					</select>
				</fieldset>
			</div>
        	
        	
   		</div>
    </form>

</div>
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>


</body>
</html>