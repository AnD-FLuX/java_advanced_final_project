<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Account</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/style2.css">
</head>
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-dark-gray" style="width:220px">
	<h2 style="margin: 15px; font-size: 25px">Welcome ${pageContext.request.userPrincipal.name} </h2>
 <hr>
  <h5 class="w3-bar-item">Manage:</h5>
 <a href="/userAccount" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
 <a href="/entrantAccount" class="w3-bar-item w3-button w3-red w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
  <hr>
  <h5 class="w3-bar-item">General:</h5>
  
  <a href="/home" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-home"></i>  Home</a>
  <a href="/registrationFaculty" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-university"></i>  Registration Faculty</a>
  <a href="/myApplications" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-outdent"></i>  My Applications</a>
  <hr>
  <h5 class="w3-bar-item">Administration:</h5>
      <a href="/viewFaculties" class="w3-bar-item w3-button w3-hover-blue  w3-cursive"><i class="fas fa-user-graduate"></i>  View Faculties</a>  
  <a href="/createFaculty" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="far fa-edit"></i>  Creating Faculties</a>
  <a href="/viewApplications" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="fas fa-list-ol"></i>  View Applications</a>
  <hr>
  <h5 class="w3-bar-item">System:</h5>
  <a onclick="document.forms['logoutForm'].submit()" class="w3-bar-item w3-button w3-hover-red w3-cursive"><i class="fas fa-sign-out-alt"></i>  LogOut</a>

   <div class="w3-display-bottommiddle"><img src="/images/logo.png" alt="education" style="width:200px"></div>                             
</div>

<!-- Page Content -->
<div style="margin-left:220px">
<div class="w3-container w3-dark-gray w3-center w3-card-4">
  <h2><i class="fab fa-centos" style="text-shadow: 3px 2px 0 #444"></i>  System Admissions Committee</h2>
</div>


    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>   </c:if>

<!--Content -->

					<div class="w3-container w3-red w3-margin w3-card-4">
  						<h2>Entrant Account:</h2>
						</div>
						
<div class="w3-container">

 
    <div class="w3-container w3-card-4 w3-light-grey" style="width:800px; padding:25px">
        <div class="w3-half" >

        <div class="w3-card-2" style="width:320px">
        <img src="${entrantInfo.uploadPhoto}" class="w3-border" alt="entrant" style="width:100%"></div>
           </div>
        <div class="w3-half" >
            <h2 class="">${userInfo.firstName}  ${userInfo.lastName}</h2>
          <br>
            <label class="">Email:</label>
            <h3 class="">${userInfo.email}</h3>

            <label class="">City:</label>
            <h3 class="">${entrantInfo.city}</h3>

            <label class="">Shcool:</label>
            <h3 class="">${entrantInfo.school}</h3>

        </div>
       
      </div>
      </div>
        
       


</div>




<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>