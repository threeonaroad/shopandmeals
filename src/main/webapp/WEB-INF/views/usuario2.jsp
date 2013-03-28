<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<title><fmt:message key="text.listado"/></title>
<style>
.error {
	color: #ff0000;
	font-weight: bold;
}
</style>
</head>

<body>


<table border="0">
		<tr>
			<th>Id</th>
			<th><fmt:message key="text.nombre"/></th>
			<th><fmt:message key="text.apellido"/></th>
			<th>Email</th>
			<th><fmt:message key="text.usuario"/></th>
			<th><fmt:message key="text.clave"/></th>
		</tr>
	 
		<tr>
			<td>${usuario.id}</td>
			<td>${usuario.nombre}</td>
			<td>${usuario.apellido}</td>
			<td>${usuario.email}</td>
			<td>${usuario.userName}</td>
			<td>${usuario.clave}</td>
		</tr>
	
</table>

<p><a href="<c:url value="/usuarios"/>">Inicio</a></p>


</html>