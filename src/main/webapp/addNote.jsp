<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="links.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>

		<div class="addNote">
			<h1>Create a new Note</h1>
			<br>
			<form action="sendNote" method="post">
				<div class="mb-3">
					<label for="noteTitle" class="form-label">Note Title </label> 
					<input
						name="title"
						type="text" 
						class="form-control"
						placeholder="enter title" 
						id="noteTitle" required>
				</div>
				<div class="mb-3">
					<label for="noteBody" class="form-label">Note Description</label>
					<textarea name="content" required class="noteBody form-control" placeholder="enter description here" style="min-height: 300px; font-family: 'Handlee', cursive; font-size:20px;"></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-success ">Add</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>