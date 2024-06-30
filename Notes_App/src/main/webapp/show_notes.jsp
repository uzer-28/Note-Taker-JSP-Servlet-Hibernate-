<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@ include file="allcss.jsp"%>

<title>Add Notes</title>
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>



		<c:if test="${not empty success }">
			<br>
			<div class="alert alert-success" role="alert">${success}</div>
			<c:remove var="success" />
		</c:if>

		<br>
		<h2 class="text-center">Your Notes</h2>

		<%
		Session session1 = new FactoryProvider().getFactory().openSession();
		Query query = session1.createQuery("from Note");
		List<Note> list = query.list();
		%>

		<div class="row">
			<div class="col-12">
				<%
				for (Note note : list) {
				%>
				
				<div class="card mt-3 " >
					<img src="img/essay.png" class="card-img-top m-4" style="max-width: 100px;">
					<div class="card-body">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text"><%= note.getContent() %></p>
						<a href="deleteNote?id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
					</div>
				</div>
				
				
				<%
				}

				session1.close();
				%>
			</div>
		</div>

	</div>

</body>
</html>