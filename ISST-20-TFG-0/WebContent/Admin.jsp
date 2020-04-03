<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Admin</h2>
<p><b>Número de trabajos activos: </b>${fn:length(tfgs)}</p>
<p><b>Número de profesores activos: </b>${fn:length(profesores)}</p>

<h2>Profesores</h2>
<table border="1">
	<c:forEach items="${profesores}" var="profesori">
		<tr>
			<td>${profesori.name}</td>
			<td>${profesori.email}</td>
		</tr>
	</c:forEach>
</table>

<h2>TFGs</h2>
<table border="1">
	<tr>
			<td>Titulo</td>
			<td>Status</td>
			<td>Email</td>
			<td>Info adicional</td>
	</tr>
	<c:forEach items="${tfgs}" var="tfgi">
		<tr>
			<td>${tfgi.title}</td>
			<td>${tfgi.status}</td>
			<td>${tfgi.email}</td>
			<td>
				<c:choose>
					<c:when test="${tfgi.status == 1}">
						<p><b>TFG en estado </b> ${tfgi.status}</p>
					</c:when>
					<c:when test="${tfgi.status == 3}">
						<p>TFG aceptado</p>
					</c:when>
					<c:when test="${tfgi.status == 4}">
						<p>Memoria del TFG subida</p>
						<p>
			        		<b>Descargar memoria: </b>
			       			<form action="ServeFileServlet" method="get">
			                <input type="hidden" name="tfgemail" value="${tfgi.email}" />
			        		<button type="submit">Descargar</button>
			        		</form>
			       		</p>
					</c:when>
					<c:when test="${tfgi.status == 2}">
						<form action="Form3SecretaryServlet">
							<input type="hidden" name="tfgemail" value="${tfgi.email}" />
							<button type="submit">Aceptar Realización TFG de ${tfgi.email}</button>
						</form>
					</c:when>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>


<h2>Registrar un nuevo profesor</h2>
<%@ include file = "FormCreaProfesor.jsp" %>

<h2>
<form action="FormLogoutServlet">
<button type="submit">Logout</button>
</form>
</h2>

</body>
</html>