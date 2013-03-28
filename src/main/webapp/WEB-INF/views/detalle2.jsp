<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h3><fmt:message key="text.listado"/></h3>
<p><a href="/rest/j_spring_security_logout">LogOut</a></p>

<table border="0">
	<tr>
		<th>Id</th>
		<th><fmt:message key="text.nombre"/></th>
		<th><fmt:message key="text.apellido"/></th>
		<th>Email</th>
		<th><fmt:message key="text.usuario"/></th>
		<th><fmt:message key="text.clave"/></th>
		<th><fmt:message key="text.editar"/></th>
		<th><fmt:message key="text.eliminar"/></th>
		<th>Ver detalle</th>
		<th>Ver Formato JSON</th>
	</tr>
	 <c:forEach items="${usuarios}" var="usuario">
		<tr>
			<td>${usuario.id}</td>
			<td>${usuario.nombre}</td>
			<td>${usuario.apellido}</td>
			<td>${usuario.email}</td>
			<td>${usuario.userName}</td>
			<td>${usuario.clave}</td>
			<td><a href="<c:url value="/usuarios/crearForm.htm?id=${usuario.id}"/>"><fmt:message key="text.editar"/></a></td>
            <td><a onclick="return confirm('Esta seguro?');" href="<c:url value="/usuarios/eliminar.htm?id=${usuario.id}"/>"><fmt:message key="text.eliminar"/></a></td>
            <td><a  href="<c:url value="/usuarios/${usuario.id}"/>">Ver detalle</a>
             <td><a  href="<c:url value="/usuarios/${usuario.id}.json"/>">Ver detalle JSON</a>
            </td>       
		</tr>
	 </c:forEach>
</table>

<p><a href="<c:url value="/usuarios/crearForm.htm"/>">Agregar Producto (+)</a></p>
<p><a href="<c:url value="/usuarios.json"/>">Ver listado JSON</a></p>

</html>