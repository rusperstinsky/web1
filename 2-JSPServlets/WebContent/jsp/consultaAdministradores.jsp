<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Consulta de Administradores</h1><br/>
	<c:out value="${requestScope.mensaje}" /><br/>
	<c:forEach var="admin" items="${sessionScope.administradores}">
		<c:out value="${admin.nombre}" />, ${admin.contrasena}, ${admin.email}, ${admin.estado}
		
		<c:catch var="ex" >
			<c:set var="id" value="${admin.id}" />
			<sql:query var="rs" dataSource="jdbc/TestDB">
				SELECT pregunta FROM pregunta WHERE id = id;
			</sql:query>
			<c:forEach var="row" items="${rs.rows}">
				<c:out value="${row.pregunta}" />
			</c:forEach>
			<br />
		</c:catch>
		
		<c:if test="${ex != null}">
			<span style="color:red">
				Error en la conexi�n.<br/>			
			</span>
		></c:if>
	</c:forEach>
</body>
</html>