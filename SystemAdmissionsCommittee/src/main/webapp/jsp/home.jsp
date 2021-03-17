<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/style2.css">
</head>
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-dark-gray" style="width:15%">

  <h5 class="w3-bar-item">Manage:</h5>
 <a href="/account" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
  <hr>
  <h5 class="w3-bar-item">General:</h5>
  
  <a href="#" class="w3-bar-item w3-button w3-green w3-hover-green w3-cursive"><i class="fas fa-home"></i>  Home</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-user-graduate"></i>  Faculties</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-university"></i>  Registration Faculty</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-outdent"></i>  My Applications</a>
  <hr>
  <h5 class="w3-bar-item">Administration:</h5>
  <a href="#" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="far fa-edit"></i>  Editing Faculties</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="fas fa-list-ol"></i>  View Applications</a>
  <hr>
  <h5 class="w3-bar-item">System:</h5>
  <a onclick="document.forms['logoutForm'].submit()" class="w3-bar-item w3-button w3-hover-red w3-cursive"><i class="fas fa-sign-out-alt"></i>  LogOut</a>

   <div class="w3-display-bottommiddle"><img src="/images/logo.png" alt="education" style="width:200px"></div>                             
</div>

<!-- Page Content -->
<div style="margin-left:15%">
<div class="w3-container w3-dark-gray">
  <h2><i class="fab fa-centos" style="text-shadow: 3px 2px 0 #444"></i>  System Admissions Committee</h2>
</div>
<div class="w3-container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
<!--Content -->





        <h2>Welcome ${pageContext.request.userPrincipal.name} </h2>
        
        <hr>
        <h3 >What Is an Admission Committee?</h3>
<h4 >A college admissions committee is a group of people who work together to make decisions about who is accepted as 
part of the next matriculating class. Admissions committees are made up of admissions staffers - university employees
whose job it is to assess each applicant and decide whether or not he or she is a good fit for acceptance. Most highly 
selective schools are fairly secretive or nebulous about their admissions process, but many public schools have guaranteed 
admission for students who meet certain criteria, as well as offer specific information about expected scores and GPAs for applicants. 
The vast majority have multiple people read your application to decide whether or not you will be accepted.</h4>

<hr>
<img src="images/entrants.jpg" class="w3-border w3-padding" alt="entrant" style="width:40% ">








    </c:if>




</div>
</div>



<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>