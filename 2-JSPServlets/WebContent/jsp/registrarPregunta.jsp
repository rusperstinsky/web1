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
	<h1>Registrar pregunta</h1>
	<br />

	<c:catch var="ex">
		<sql:update var="row" dataSource="jdbc/TestDB"
			sql="INSERT INTO pregunta (pregunta) VALUES(?)">
			<sql:param value="${param.pregunta}"></sql:param>
		</sql:update>

		<c:choose>
			<c:when test="${row != 0}"> Pregunta registrada correctamente.<br />
			</c:when>
			<c:otherwise>Error al registrar la pregunta.<br />
			</c:otherwise>
		</c:choose>
		<c:forEach var="row" items="${rs.rows}">
			<c:out value="${row.pregunta}" />
		</c:forEach>
		<br />
	</c:catch>
</body>
</html>