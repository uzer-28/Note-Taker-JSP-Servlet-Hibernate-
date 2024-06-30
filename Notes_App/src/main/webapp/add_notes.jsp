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
			<c:remove var="success"/>
		</c:if>

		<br>
		<h2 class="text-center">Add Note</h2>

		<form action="addNote" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Title</label> <input
					required type="text" class="form-control" id="exampleInputEmail1"
					name="title" aria-describedby="emailHelp" placeholder="Enter Title">

			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea rows="8" cols="" placeholder="Enter Content"
					class="form-control" name="content" required></textarea>
			</div>

			<button type="submit" class="btn btn-primary">Add</button>
		</form>

	</div>

</body>
</html>