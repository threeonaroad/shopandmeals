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
	 <c:forEach items="${usuarios}" var="usuario">
		<tr>
			<td>${usuario.id}</td>
			<td>${usuario.nombre}</td>
			<td>${usuario.apellido}</td>
			<td>${usuario.email}</td>
			<td>${usuario.userName}</td>
			<td>${usuario.clave}</td>
		</tr>
	 </c:forEach>
</table>


</html>