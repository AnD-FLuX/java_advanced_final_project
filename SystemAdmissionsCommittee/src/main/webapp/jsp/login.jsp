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
    <link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
<header>
			<h1>
				<a href="#"> <img src="images/logo.png"	alt="Admissions Committee"></a>
			</h1>
		</header>
	<h1 class="text-center">Log In</h1>
    <form method="POST" action="${contextPath}/login" class="registration-form">
 

        <div class="form-group ${error != null ? 'has-error' : ''}">
              
            <div class="text-center">   	
            <span class="label-text">${message}</span>
            </div>
                
            <label>
            <span class="label-text marg-tp">Email</span> 
            <input name="email" type="text" name="email" required />
            
            </label> 
            
            <label>
            <span class="label-text">Password</span> 
            <input name="password" type="password" name="password" required />
            </label> 
            
            <div class="text-center">            
            <span>${error}</span>
            </div>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<div class="text-center marg-tp">
            	<button type="submit" class="submit" type="submit">Log In</button>
            </div>
            	
			
         	<h4 class="text-center marg-tp"><a href="${contextPath}/registration">Create an account</a></h4>
        	
        	
   		</div>
    </form>

</div>
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>


</body>
</html>