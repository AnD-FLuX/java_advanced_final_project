<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
 <sec:authorize access="hasRole('ROLE_USER')">
 <hr>
  <h5 class="w3-bar-item">Manage:</h5>
 <a href="/userAccount" class="w3-bar-item w3-button w3-red w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
</sec:authorize>
 <sec:authorize access="hasRole('ROLE_ENTRANT')">
 <hr>
  <h5 class="w3-bar-item">Manage:</h5>
 <a href="/entrantAccount" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
 </sec:authorize>
  <hr>
  <h5 class="w3-bar-item">General:</h5>
  
  <a href="/home" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-home"></i>  Home</a>
     <sec:authorize access="hasRole('ROLE_ENTRANT')">
  <a href="/registrationFaculty" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-university"></i>  Registration Faculty</a>
  <a href="/myApplications" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-outdent"></i>  My Applications</a>
    </sec:authorize>
 
  
  <hr>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
  <h5 class="w3-bar-item">Administration:</h5>
      <a href="/viewFaculties" class="w3-bar-item w3-button w3-hover-blue  w3-cursive"><i class="fas fa-user-graduate"></i>  View Faculties</a>  
  <a href="/createFaculty" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="far fa-edit"></i>  Creating Faculties</a>
  <a href="/viewApplications" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="fas fa-list-ol"></i>  View Applications</a>
  <hr>
   </sec:authorize>
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
  						<h2>User Account:</h2>
						</div>
						
<div class="w3-container">

 
    <div class="w3-display-container w3-card-4 w3-light-grey" style="height:400px;width:800px; padding:25px">
        <div class="w3-half" >

        <div class="w3-card-2 photo" style="height:300px;width:300px;"></div>
        <button style="margin:18px" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-red "><i class="far fa-edit"></i>  Adding Photo & Some Info </button>
    </div>
        <div class="w3-half" >
            <h2 class="">${userInfo.firstName}  ${userInfo.lastName}</h2>
            <br>
            <label class="">Email:</label>
            <h3 class="">${userInfo.email}</h3>

        </div>
       

        <div id="id01" class="w3-modal w3-animate-opacity">
          <div class="w3-modal-content w3-card-4">
            <header class="w3-container w3-green"> 
              <span onclick="document.getElementById('id01').style.display='none'" 
              class="w3-button w3-large w3-display-topright">&times;</span>
              <h2>Enter photo and info:</h2>
            </header>
            
            <form:form method="POST" action="${contextPath}/userAccount"
					enctype="multipart/form-data">
					
            <div class="w3-container">

                <br>
                <label for="city">City:</label><br>
                <input class="w3-input w3-border" name="city" required placeholder="Enter your city..."/>
                <br>
                <label for="school">School:</label><br>
                <input class="w3-input w3-border" name="school" type="text" required placeholder="Enter your school..."/>
                <br>
                <label for="school">Photo:</label><br>
                <input class="w3-input w3-border" name="uploadPhoto" type="file" placeholder="uploadPhoto"/>
                <br>
             
              
            </div>
            
            <footer class="w3-container ">
       
 			 <div class="w3-tag w3-round w3-red" style="padding:3px">
   			 	<div class="w3-tag w3-round w3-red w3-border w3-border-white">
   			   			 <i class="fas fa-exclamation-triangle"></i>  After submit you will be logged out  <i class="fas fa-exclamation-triangle"></i>    
   			   </div>
 			</div>

                       
            <br>
                <input class="w3-button w3-green w3-margin w3-center" type="submit"  value="Submit"></input>
               <br>
                <input type="hidden" path="email" value="email" />
                
                <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
                </footer>
                </form:form>
            
          </div>
        </div>
      </div>
      </div>
        
       


</div>




<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>