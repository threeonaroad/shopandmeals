<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
	<title><fmt:message key="text.crearUsuario"/></title>
</head>	
<body>
<div class="container">
	<h3>
		<fmt:message key="text.crearUsuario"/>
	</h3>
	<p><a href="/seguridad/j_spring_security_logout">LogOut</a></p>
	<div class="span-12 last">	
		<!-- El objeto del model "usuario" se crea dentro del metodo "crearUsuarioForm(Model model)"
			de la clase controladora "UsuarioController". -->
		<form:form modelAttribute="usuario" method="post">
		  	<fieldset>		
				<legend><fmt:message key="text.usuario"/></legend>
				<p>
					<form:label	for="nombre" path="nombre" cssErrorClass="error"><fmt:message key="text.nombre"/></form:label><br/>
					<form:input path="nombre" /> <form:errors path="nombre" />			
				</p>
				<p>	
					<form:label for="apellido" path="apellido" cssErrorClass="error"><fmt:message key="text.apellido"/></form:label><br/>
					<form:input path="apellido" /> <form:errors path="apellido" />
				</p>
				<p>
					<form:label for="email" path="email" cssErrorClass="error">Email</form:label><br/>
					<form:input path="email" /> <form:errors path="email" />
				</p>
				<p>	
					<form:label for="userName" path="userName" cssErrorClass="error"><fmt:message key="text.usuario"/></form:label><br/>
					<form:input path="userName" /> <form:errors path="userName" />
				</p>
				<p>	
					<form:label for="clave" path="clave" cssErrorClass="error"><fmt:message key="text.clave"/></form:label><br/>
					<form:input path="clave" /> <form:errors path="clave" />
				</p>
				<p>	
					<input type="submit" value="<fmt:message key="text.crearUsuario"/>"/>
				</p>
			</fieldset>
		</form:form>
	</div>
	<hr>	
</div>
</body>
</html>