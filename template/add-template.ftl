<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Add ${name?capitalize} page</h1>
<p>Here you can add a new ${name}.</p>
<form:form method="POST" commandName="${name?lower_case}" action="${r"${pageContext.request.contextPath}"}/${name?lower_case}/create.html">
<table>
<tbody>
	<#list parameters as parameter>
	   <tr>
	        <td>${parameter.name?cap_first}:</td>
	        <td><form:input path="${parameter.name}" /></td>
	   </tr>
	</#list>
    <tr>
        <td><input type="submit" value="Add" /></td>
        <td></td>
    </tr>
</tbody>
</table>
</form:form>
 
<p><a href="${r"${pageContext.request.contextPath}"}/home.html">Home page</a></p>


</body>
</html>