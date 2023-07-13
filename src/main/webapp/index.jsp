<!doctype html>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.providers.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="links.jsp"%>

<title>Note Taker</title>
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
		<img src="images/noData.jpg" alt="no data found" style="width:18rem; margin:50px;">
		<em><h2 style="font-family: 'Handlee', cursive;">No Data Found...</h2></em>
		<a href="addNote.jsp" class="btn btn-warning btn-large my-4">Create New Note</a>
	</div>
	<%
		}
		else
		{
     %>
     	<h1 style=" margin-top: 50px;font-family: 'Handlee', cursive;">Your Notes..</h1>
       <%
			for (note n : noteList) 
			{
		%>
		
		
			<div class="card sm-6" style="width:18rem; margin-top:20px;">
				<div class="card-body">
					<h5 class="card-title"><%= n.getNoteTitle()%></h5>
					<p class="card-text"><%= n.getNoteContent()%></p>
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