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

    <title>Registration Faculty</title>
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
 <a href="/userAccount" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  Account</a>
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
  <a href="/myApplications" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-outdent"></i>  My Applications</a>
  <a href="/registrationFaculty" class="w3-bar-item w3-button w3-hover-green w3-green w3-cursive"><i class="fas fa-university"></i>  Registration Faculty</a>
  
  </sec:authorize>
  
  <sec:authorize access="hasRole('ROLE_ADMIN')">
  <hr>
    <h5 class="w3-bar-item">Administration:</h5>
    <a href="/viewFaculties" class="w3-bar-item w3-button w3-hover-blue  w3-cursive"><i class="fas fa-user-graduate"></i>  View Faculties</a>
  <a href="/createFaculty" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="far fa-edit"></i>  Creating Faculties</a>
  <a href="/viewApplications" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="fas fa-list-ol"></i>  View Applications</a>
 </sec:authorize>
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
        </form>  </c:if>
        
<!--Content -->

<div class="w3-container w3-green w3-margin w3-card-4">
  						<h2>Add info for registration for the faculty:</h2>
						</div>
						
<div class="w3-container w3-margin" style="display: flex; flex-wrap: wrap;">
 
		<form:form method="POST" action="${contextPath}/addReg" enctype="multipart/form-data"> 
   
    <div class="w3-row-padding w3-section w3-stretch w3-card-4 w3-light-grey" style="width:1000px;padding:25px">
        <div class="w3-col s4" >

        <div class="w3-card-2" >
        <img src="${entrantInfo.uploadPhoto}" class="w3-border" alt="entrant" style="width:100%"></div>
        <br>
           <h4 class="">Entrant: ${userInfo.firstName}  ${userInfo.lastName}</h4>
                   
            <label class="">City: ${entrantInfo.city}</label>
            <h4 class=""></h4>

            <label class="">Shcool: ${entrantInfo.school}</label>
            <h4 class=""></h4>
            
            
             
            
           </div>
           
          
        <div class="w3-col s4" >
         					 <c:forEach items="${currentFaculty.subjects}" var="currentSubject">
										<tr style="height: 70px">
											<td><label >Subject  ${currentSubject}</label></td>
											<td><input type="number" name="marks" min="0" value="100"/> </td>
										</tr>
									<br>
							</c:forEach>
									
									
									
				<label for="documentPhoto">User certificate scan image</label><br>
				<input type="file" id="documentPhoto" name="documentPhoto" style="margin-top: 10px; margin-bottom: 10px" required><br>
        </div>
        <div class="w3-col s4" >
							<img src="${currentFaculty.logoUrl}" style="height: 160px; width: 100%">
							<div class="w3-container w3-center w3-light-grey" >
								<h3>${currentFaculty.name}</h3>
								<p>Students: ${currentFaculty.numberOfStudents}</p>	
							</div>
							
						</div>
				<br>	
			
							<input type="hidden" name="facultyId"	value="${registrationForFaculty.faculty.id}" />
							<input type="hidden" name="email"	value="${registrationForFaculty.entrant.user.email}" />
							
			<input  class="w3-btn w3-green w3-hover-red w3-right" style="margin:30px; width:150px;" type="submit" value="Submit" />			
						
      
      </div>
     
		</form:form>
		
		
			

</div>
</div>



<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>