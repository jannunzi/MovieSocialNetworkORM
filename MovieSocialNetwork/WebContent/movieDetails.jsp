<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.msn.orm.dao.*,edu.neu.cs5200.msn.orm.models.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<%
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr);

		MovieDAO dao = new MovieDAO();
	
		String action = request.getParameter("action");
		String first  = request.getParameter("first");
		String last  = request.getParameter("last");
		String dob  = request.getParameter("dob");
		
		if("create".equals(action))
		{
			Actor actor = new Actor(null, first, last, new Date(), null);
			dao.addActor(id, actor);
		}
		
		Movie movie = dao.readMovieById(id);
	%>
	<div class="container">
		<h1>Movie: <%= movie.getTitle() %></h1>
		
		<h2>Actors</h2>
		
		<form action="movieDetails.jsp">
			<input type="hidden" name="id" value="<%= idStr %>"/>
			
		<table class="table table-striped">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date of Birth</th>					
				</tr>
				<tr>
					<th><input class="form-control" name="first"/></th>
					<th><input class="form-control" name="last"/></th>
					<th><input class="form-control" name="dob"/></th>
					<th>
						<button name="action" value="create" type="submit" class="btn btn-primary">Add</button>
					</th>

				</tr>
			</thead>
			<tbody>
	<%
		List<Actor> actors = movie.getActors();
		for(Actor actor : actors)
		{
	%>
				<tr>
					<td><%= actor.getFirst() %></td>
					<td><%= actor.getLast() %></td>
					<td><%= actor.getDob() %></td>
				</tr>
	<%		
		}
	%>
			</tbody>
		</table>
		</form>
	</div>
</body>
</html>