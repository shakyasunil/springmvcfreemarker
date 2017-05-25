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

<h1>Add User page</h1>
<p>Here you can add a new User.</p>
<form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/user/create.html">
<table>
<tbody>
	   <tr>
	        <td>FirstName:</td>
	        <td><form:input path="firstName" /></td>
	   </tr>
	   <tr>
	        <td>LastName:</td>
	        <td><form:input path="lastName" /></td>
	   </tr>
	   <tr>
	        <td>Email:</td>
	        <td><form:input path="email" /></td>
	   </tr>
	   <tr>
	        <td>Password:</td>
	        <td><form:input path="password" /></td>
	   </tr>
    <tr>
        <td><input type="submit" value="Add" /></td>
        <td></td>
    </tr>
</tbody>
</table>
</form:form>
 
<p><a href="${pageContext.request.contextPath}/home.html">Home page</a></p>


</body>
</html>