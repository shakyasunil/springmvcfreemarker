<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>List of ${name}s</title>
</head>
<body>
<h1>List of ${name}s</h1>
<p>Here you can see the list of the users, edit them, remove or update.</p>
<table border="1px" cellpadding="0" cellspacing="0" >
<thead>
<tr>
<#list parameters as parameter>
	   <th>${parameter.name?cap_first}</th>
</#list>
</tr>
</thead>
<tbody>
<c:forEach var="${name?lower_case}" items="${r"${"}${name?lower_case}s}">
<tr>
	<td>${r"${"}${name?lower_case}.id}</td>
	
	<#list parameters as parameter>
	   <td>${r"${"}${name?lower_case}.${parameter.name}}</td>
	</#list>
	
	
	<td>
	<a href="${r"${pageContext.request.contextPath}"}/${name?lower_case}/edit/${r"${"}${name?lower_case}.id}.html">Edit</a><br/>
	<a href="${r"${pageContext.request.contextPath}"}/${name?lower_case}/delete/${r"${"}${name?lower_case}.id}.html">Delete</a><br/>
	</td>
</tr>
</c:forEach>
</tbody>
</table>

<p><a href="${r"${pageContext.request.contextPath}"}/home.html">Home page</a></p>

</body>
</html>