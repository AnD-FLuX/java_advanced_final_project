<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

    <title>Creating Faculties</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/style2.css">
</head>
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-dark-gray" style="width:220px">
	<h2 style="margin: 15px; font-size: 25px"><spring:message code='welcome'/> ${pageContext.request.userPrincipal.name} </h2>

  
  <sec:authorize access="hasRole('ROLE_USER')">
   <hr>
  <h5 class="w3-bar-item"><spring:message code='manage'/>:</h5>
 <a href="/userAccount" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  <spring:message code='account'/></a>
 </sec:authorize>
   <sec:authorize access="hasRole('ROLE_ENTRANT')">
     <hr>
  <h5 class="w3-bar-item"><spring:message code='manage'/>:</h5>
 <a href="/entrantAccount" class="w3-bar-item w3-button w3-hover-red w3-cursive"> <i class="far fa-address-card"></i>  <spring:message code='account'/></a>
 </sec:authorize>
  <hr>
  <h5 class="w3-bar-item"><spring:message code='general'/>:</h5>
  
  <a href="/home" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-home"></i>  <spring:message code='home'/></a>
  <sec:authorize access="hasRole('ROLE_ENTRANT')">
    <a href="/registrationFaculty" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-university"></i>  <spring:message code='registrationFaculty'/></a>
  <a href="/myApplications" class="w3-bar-item w3-button w3-hover-green w3-cursive"><i class="fas fa-outdent"></i>  <spring:message code='myApplications'/></a>
  </sec:authorize>
  
  <sec:authorize access="hasRole('ROLE_ADMIN')">
  <hr>
    <h5 class="w3-bar-item"><spring:message code='administration'/>:</h5>
    <a href="/viewFaculties" class="w3-bar-item w3-button w3-hover-blue  w3-cursive"><i class="fas fa-user-graduate"></i>  <spring:message code='viewFaculties'/></a>
  <a href="/createFaculty" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="far fa-edit"></i>  <spring:message code='createFaculty'/></a>
  <a href="/viewApplications" class="w3-bar-item w3-button w3-hover-blue w3-cursive"><i class="fas fa-list-ol"></i>  <spring:message code='viewApplications'/></a>
 </sec:authorize>
  <hr>
  <h5 class="w3-bar-item"><spring:message code='system'/>:</h5>
  <a onclick="document.forms['logoutForm'].submit()" class="w3-bar-item w3-button w3-hover-red w3-cursive"><i class="fas fa-sign-out-alt"></i>  <spring:message code='logout'/></a>

   <div class="w3-display-bottommiddle"><img src="/images/logo.png" alt="education" style="width:200px"></div>                             
</div>

<!-- Page Content -->
<div style="margin-left:220px">
<div class="w3-container w3-dark-gray w3-center w3-card-4">
  <h2><i class="fab fa-centos" style="text-shadow: 3px 2px 0 #444"></i>  <spring:message code='sac'/></h2>
</div>


    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>  </c:if>
<!--Content -->


		<div class="w3-container w3-blue w3-margin w3-card-4">
  						<h2><spring:message code='Createnewfaculty'/>:</h2>
						</div>
  <div class="w3-container  w3-border-blue " style="width: 50%">


						
						
				 <form:form class="w3-container w3-card-4 w3-light-grey" method="POST" action="${contextPath}/addFaculty" enctype="multipart/form-data">
					<div class="w3-container" style="display:flex">
					
					<div class="w3-container" style="width:50%">
					
					<br>
							<label  class="w3-text-blue" name="name" ><spring:message code='name'/>:</label>
							<input class="w3-input w3-border" name="name" required/>
							<br>
							<label  class="w3-text-blue " name="numberOfStudents"><spring:message code='numb'/>:</label>
							<input class="w3-input w3-border" name="numberOfStudents" type="number" required/>
							<br>
							<label  class="w3-text-blue " name="logoUrl"><spring:message code='facLogo'/>:</label><br>
                            <input class="w3-input w3-border"  name="logoUrl" type="file" required/><br>
					</div>
					
					<div class="w3-container" style="width:50%">
					<br>
								<label class="w3-text-blue " for="firstSubject"><spring:message code='firstsub'/></label><br>
                                <input class="w3-input w3-border" type="text" id="firstSubject" name="firstSubject" value="<spring:message code='Ukrainian'/>" readonly><br>
                                                                                  
                                <label class="w3-text-blue " for="secondSubject"><spring:message code='secondsub'/></label><br>
                                <select class="w3-select w3-border" name="secondSubject" id="secondSubject">
                                 <option value="Mathematics"><spring:message code='Mathematics'/></option>
                                    <option value="English"><spring:message code='English'/></option>
                                    <option value="Physics"><spring:message code='Physics'/></option>
                                    <option value="Biology"><spring:message code='Biology'/></option>
                                    <option value="History"><spring:message code='History'/></option>
                        	    </select>   
                                       <br> 
                                   <br>                                                                 
                                <label class="w3-text-blue " for="thirdSubject"><spring:message code='thirdsub'/></label><br>
                                <select class="w3-select w3-border" name="thirdSubject" id="thirdSubject">
                                    <option value="Mathematics"><spring:message code='Mathematics'/></option>
                                    <option value="English"><spring:message code='English'/></option>
                                    <option value="Physics"><spring:message code='Physics'/></option>
                                    <option value="Biology"><spring:message code='Biology'/></option>
                                    <option value="History"><spring:message code='History'/></option>
                                </select>
						
							</div>	
							</div>
							<br>
							<input  class="w3-btn w3-blue w3-hover-green w3-right" style="margin:30px; width:150px;" type="submit" value="Submit" />
						
				
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form> 
				


 



</div>
</div>



<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>