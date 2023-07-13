<!DOCTYPE html>
<%@page import="com.entities.note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.providers.FactoryProvider"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="links.jsp"%>
</head>
<body>
		
	<div class="container">
		<%@include file="navbar.jsp"%>
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from note");
		List<note> noteList = q.list();
		if(noteList.size()==0)
		{
		%>
			<div class="container-fluid text-center">
				<img src="images/noData.jpg" alt="no data found" style="width: 18rem; margin: 50px;"> 
				<em><h2 style="font-family: 'Handlee', cursive;">No Data Found...</h2></em>
			</div>
		<%
		}
		else
		{
			for (note n : noteList) 
			{
		%>

			<div class="card" id="noteCard" style="margin: 15px 15px;">
				<div class="card-body">
					<h5 class="card-title"><%= n.getNoteTitle()%></h5>
					<p class="card-text"><%= n.getNoteContent()%></p>
				<div class="container text-center">
					<a href="updateNote.jsp?noteID=<%= n.getId()%>" class="btn btn-primary btn-sm mx-2"><i class="fa-solid fa-pencil"  style="color: #000000;"></i> Edit</a> 
					<a href="DeleteServlet?noteID=<%= n.getId()%>" class="btn btn-danger btn-sm mx-2" ><i class="fa-regular fa-trash-can" ></i> Delete</a>
				</div>					
				</div>
			</div>
		<%
		}
	}
		s.close();
	%>
	</div>
		
</body>
</html>