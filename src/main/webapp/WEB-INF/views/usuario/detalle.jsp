<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
	<title>Ver Usuario</title>	
</head>	
<body>
<div class="container">
	<h1>
		Ver Usuario
	</h1>
	<div class="span-12 last">	
		<form:form modelAttribute="usuario" action="${usuario.id}" method="post">
		  	<fieldset>		
				<legend>Usuario</legend>
				<p>
					<form:label	for="nombre" path="nombre">Nombre</form:label><br/>
					<form:input path="nombre" readonly="true"/>		
				</p>
				<p>	
					<form:label for="apellido" path="apellido">Apellido</form:label><br/>
					<form:input path="apellido" readonly="true"/>
				</p>
				<p>
					<form:label for="email" path="email">Email</form:label><br/>
					<form:input path="email" readonly="true"/>
				</p>
				<p>	
					<form:label for="userName" path="userName">User Name</form:label><br/>
					<form:input path="userName" readonly="true"/>
				</p>
				
				<p>	
					<form:label for="clave" path="clave">Clave</form:label><br/>
					<form:input path="clave" readonly="true"/>
				</p>
			</fieldset>
		</form:form>
	</div>
	<hr>	
</div>
</body>
</html>