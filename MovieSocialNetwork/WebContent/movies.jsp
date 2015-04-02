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
	<div class="container">
		<%
			MovieDAO dao = new MovieDAO();
		
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			String title  = request.getParameter("title");
			String plot   = request.getParameter("plot");
			String poster   = request.getParameter("poster");
					
			if("create".equals(action))
			{
				Movie movie = new Movie(null, title, plot, poster, null);
				dao.createMovie(movie);
			}
			else if("delete".equals(action))
			{
				Integer id = Integer.parseInt(idStr);
				dao.deleteMovie(id);
			}
				
			List<Movie> movies = dao.readAllMovies();
		%>
		<h1>
			Movies
		</h1>
		<form action="movies.jsp">
		<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>Plot</th>
				<th>Poster</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input name="title" class="form-control"/></td>
				<td><input name="plot" class="form-control"/></td>
				<td><input name="poster" class="form-control"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create">Create</button>
				</td>
			</tr>
		<%
			for(Movie movie : movies)
			{
		%>	<tr>
				<td>
					<a href="movieDetails.jsp?id=<%= movie.getId() %>">
					<%= movie.getTitle() %>
					</a>
				</td>
				<td><%= movie.getPlot() %></td>
				<td><%= movie.getPoster() %></td>
				<td>
					<a href="movies.jsp?action=delete&id=<%= movie.getId() %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		</form>
	</div>
</body>
</html>