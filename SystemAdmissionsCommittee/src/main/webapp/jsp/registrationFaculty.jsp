<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="w3-container w3-green w3-margin w3-card-4">
  						<h2><spring:message code='registrationFaculty'/>:</h2>
						</div>
						
<div class="w3-container" style="display: flex; flex-wrap: wrap;">
 
			<c:if test="${not empty registrationFaculty}">
					<c:forEach items="${registrationFaculty}" var="currentFaculty">
					
						<div class="w3-card-4" style="width: 250px; margin:2%" >
							<img src="${currentFaculty.logoUrl}" style="height: 160px; width: 100%">
							<div class="w3-container w3-center w3-light-grey">
								<h3>${currentFaculty.name}</h3>
								<p>${currentFaculty.numberOfStudents}</p>
								<p>${currentFaculty.subjects}</p>
								<a href="${contextPath}/addReg?id=${currentFaculty.id}" class="w3-btn w3-hover-grey w3-green w3-margin-bottom" ><spring:message code='Registerhere'/></a>
							</div>
						</div>
					
					</c:forEach>
				</c:if>


</div>
</div>



<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>