<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sesión cerrada con éxito</title>
</head>
<body>
<h2>Esta es mi_pagina_logout.jsp. Indica que se ha cerrado la sesión correctamente. </h2>
<p><a href="<c:url value="/usuarios"/>">Ir las listado de Usuarios</a></p>
<p><a href="<c:url value="/usuarios/crearForm.htm"/>">Agregar un nuevo usuario</a></p>
</body>
</html>