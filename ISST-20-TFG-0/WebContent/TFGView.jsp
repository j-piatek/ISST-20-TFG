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

<div>
<h2>Página del TFG de ${tfg.name}</h2>
<p>Título del TFG: ${tfg.title}</p>
<p>Estado del TFG: ${tfg.status}</p>
<c:if test="${tfg.status == 3}">
	<form action="Form4TFGServlet" method="post" enctype="multipart/form-data">
		<input type="hidden" name="tfgemail" value="${tfg.email}" />
		<input type="file" name="file" />
		<button type="submit">Subir memoria</button>
	</form>
</c:if>
</div>

<div>
<p>Tutor del TFG: ${tfg.advisor.name}</p>
<p>Email del tutor del TFG: ${tfg.advisor.email}</p>
</div>

<div>
<c:if test="${tfg.status > 3}">
        <p>
        <b>Descargar memoria: </b>
        <form action="ServeFileServlet" method="get">
                <input type="hidden" name="tfgemail" value="${tfg.email}" />
        		<button type="submit">Descargar</button>
        </form>
        </p>
</c:if>
</div>
<h2>
<form action="FormLogoutServlet">
<button type="submit">Logout</button>
</form>
</h2>

</body>
</html>