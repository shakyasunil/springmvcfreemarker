<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
	integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
	crossorigin="anonymous"></script>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<title>Welcome</title>
</head>
<body>
	<h1>Home page</h1>
	<p>
     ${r"${message}"}<br />
	<#list modules as module>
	   <a
			href="${r"${pageContext.request.contextPath}"}/${module.name?lower_case}/create.html">Add
			new ${module.name}</a><br /> 
			<a
			href="${r"${pageContext.request.contextPath}"}/${module.name?lower_case}/list.html">${module.name}
			list</a><br />
	</#list>	
			
	</p>

</body>
</html>