<%@page import="com.entities.note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.providers.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<%@include file="links.jsp"%>
		<div class="addNote">
			<h1>Edit your note</h1>
			<br>
			<%
			Session s = FactoryProvider.getFactory().openSession();
			int noteID = Integer.parseInt(request.getParameter("noteID").trim());
			note n = (note) s.get(note.class, noteID);
			%>
			<form action="updateNoteServlet" method="post">
				<div class="mb-3">
					<label for="noteTitle" class="form-label">Note Title </label> <input
						name="title" type="text" class="form-control"
						placeholder="enter title" id="noteTitle" value="<%= n.getNoteTitle() %>" required>
				</div>
				<div class="mb-3">
					<label for="noteBody" class="form-label">Note Description</label>
					<textarea name="content" required class="noteBody form-control"
						placeholder="enter description here"
						style="min-height: 300px; font-family: 'Handlee', cursive; font-size: 20px;"><%= n.getNoteContent() %></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-success ">Add</button>
				</div>
				<input name="noteID" value="<%= noteID %>" style="visibility:hidden;">
			</form>
		</div>
	</div>
</body>
</html>