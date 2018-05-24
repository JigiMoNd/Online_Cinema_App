<%@ include file="/WEB-INF/taglib.jsp" %>
<h2>Home page</h2>	
	<form:form action="/login" method="POST">
	
		Email: <input type="text" name="email"> <br>
		Password: <input type="password" name="password"> <br>
		<input type="submit" value="Log In">
		
	</form:form>

<a href="/login">Log in</a> <br>
<a Href="/users/registration">Register</a> <br>
<a href="/profile">Profile</a> <br>

<a href="/movie/add-movie">Add Movies</a> <br>

<a href="/hall/list-of-halls">All Halls</a> <br>
<a href="/session/list-of-sessions">All Sessions</a> <br>
<a href="/movie/list-of-movies">All Movie</a> <br>
<a href="/users/list-of-users">All Users</a> <br>
<iframe width="560" height="315" src="https://www.youtube.com/embed/So4BPR-30mY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

<iframe width="560" height="315" th:src="@{https://www.youtube.com/embed/{url} (url=${article.video})}"   frameborder="0" alt="no video attached" allowfullscreen="1"></iframe>
