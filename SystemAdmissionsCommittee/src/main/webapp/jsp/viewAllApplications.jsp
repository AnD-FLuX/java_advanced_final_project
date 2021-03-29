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

    <title>View Applications</title>
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
        </form>    </c:if>
<!--Content -->

<div class="w3-container w3-blue w3-margin w3-card-4">
  						<h2><spring:message code='viewApplications'/>:</h2>
						</div>

<div class="w3-container">


  <input class="w3-input w3-border w3-padding w3-card-4" type="text" placeholder="Search for faculties.." id="myInput" onkeyup="searchFaculyFunction()">
  
		
	<p><button class="w3-button w3-blue w3-hover-green" onclick="sortTable()">Sort by marks</button></p>
	
		<table id="myTable" class="w3-table-all w3-centered w3-card-4">
			<thead>
				<tr>
				<th><spring:message code='Logo'/></th>
				<th><spring:message code='Faculty'/></th>
				<th><spring:message code='firstName'/></th>
				<th><spring:message code='lastName'/></th>
				<th><spring:message code='email'/></th>
				<th><spring:message code='Photo'/></th>
				<th><spring:message code='Marks'/></th>
				<th><spring:message code='Certificatmark'/></th>
				<th><spring:message code='Document'/></th>
				<th><spring:message code='AvarageMark'/></th>
				<th><spring:message code='Delete'/></th>
				</tr>
			</thead>

				<c:forEach items="${facultyRegistrations}" var="currentRegistration">
					<tr>
						<td><img 
								src="${currentRegistration.faculty.logoUrl}"
								alt="logo" style="width: 50px"></td>
						<td>${currentRegistration.faculty.name}</td>
						<td>${currentRegistration.entrant.user.firstName}</td>
						<td>${currentRegistration.entrant.user.lastName}</td>
						<td>${currentRegistration.entrant.user.email}</td>
						<td><img class="w3-hover-opacity"
								src="${currentRegistration.entrant.uploadPhoto}"
								alt="uploadPhoto" style="width: 50px"
								onclick="document.getElementById('${currentRegistration.id}1').style.display='block'">
						</td>
						<td>${currentRegistration.faculty.subjects}<br>${currentRegistration.marks}</td>
						<td>${currentRegistration.entrant.certificatAvarageMark}</td>
						<td><img class="w3-hover-opacity"
								src="${currentRegistration.uploadDocument}"
								alt="uploadPhoto" style="width: 50px"
								onclick="document.getElementById('${currentRegistration.id}2').style.display='block'"></td>
						<td>${currentRegistration.sumMarks}</td>
						<td><a href="${contextPath}/viewApplications/delete/${currentRegistration.id}" 
										class="w3-btn w3-hover-red w3-blue w3-margin-bottom"><i class="far fa-trash-alt"></i></a></td>
					</tr>
					
					
					
	  <div id="${currentRegistration.id}1" class="w3-modal">
    	<div class="w3-modal-content">
     		 <div class="w3-container">
       			 <span onclick="document.getElementById('${currentRegistration.id}1').style.display='none'" class="w3-button w3-red w3-display-topright">&times;</span>
      		  <img src="${currentRegistration.entrant.uploadPhoto}" style="width: 100%">
     		 </div>
    		</div>
		  </div>
		  
		  <div id="${currentRegistration.id}2" class="w3-modal">
    	<div class="w3-modal-content">
     		 <div class="w3-container">
       			 <span onclick="document.getElementById('${currentRegistration.id}2').style.display='none'" class="w3-button w3-red w3-display-topright">&times;</span>
      		  <img src="${currentRegistration.uploadDocument}" style="width: 100%">
     		 </div>
    		</div>
		  </div>
				</c:forEach>

			</tbody>
		</table>







</div>
</div>



<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
function searchFaculyFunction() {

  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}



function sortTable() {
	  var table, rows, switching, i, x, y, shouldSwitch;
	  table = document.getElementById("myTable");
	  switching = true;
	
	  while (switching) {
	    switching = false;
	    rows = table.rows;
	
	    for (i = 1; i < (rows.length - 1); i++) {
	    	shouldSwitch = false;
	     	x = rows[i].getElementsByTagName("td")[9];
	      	y = rows[i + 1].getElementsByTagName("td")[9];
	      if (Number(x.innerHTML) < Number(y.innerHTML)) {
	        shouldSwitch = true;
	        break;
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	    }
	  }
	}
</script>

</body>
</html>