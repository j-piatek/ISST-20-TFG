<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Página del profesor ${profesor.name}</h2>
<p>Nombre: ${profesor.name}</p>
<p>Email: ${profesor.email}</p>
<p>Número de TFGs tutorizados:</b> ${fn:length(profesor.advisedTFGs)}</p>
<p>Lista de TFGs tutorizados:</p>

<table border="1">
<c:forEach items="${profesor.advisedTFGs}" var="tfgi">
	<tr>
		<td>${tfgi.name}</td>
		<td>${tfgi.email}</td>
		<td>${tfgi.title}</td>
		<td>
			<c:choose>
				<c:when test="${tfgi.status == 1}">
					<form action="Form2ProfessorServlet">
					<input type="hidden" name="tfgemail" value="${tfgi.email}" />
					<button type="submit">Aceptar Tutela</button>
					</form>
				</c:when>
				<c:when test="${tfgi.status == 2}">
					<p>TFG aceptado</p>
				</c:when>
				<c:when test="${tfgi.status > 3}">
			        <p>
			        <b>Descargar memoria: </b>
			        <form action="ServeFileServlet" method="get">
			                <input type="hidden" name="tfgemail" value="${tfgi.email}" />
			        		<button type="submit">Descargar</button>
			        </form>
			        </p>
				</c:when>
			</c:choose>
		</td>
	</tr>
</c:forEach>
</table>

<h2>
<form action="FormLogoutServlet">
<button type="submit">Logout</button>
</form>
</h2>

</body>
</html>