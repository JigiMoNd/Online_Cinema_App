<%@ include file="/WEB-INF/taglib.jsp" %>
<h2>Home page</h2>	

<a Href="/registration">Register</a> <br>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR', 'USER')">
<a href="/profile">Profile</a> <br>
</sec:authorize>

<sec:authorize access="hasRole('ADMIN')">
<a href="/admin/add-movie">Add Movies</a> <br>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/edit-movie">Edit Movies</a> <br>
</sec:authorize>
<%-- 
<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR', 'USER')"> --%>
<a href="/user/movie">Movie</a> <br><%-- 
</sec:authorize> --%>

<a href="/list-of-movies">All Movie</a> <br>

<sec:authorize access="hasRole('ADMIN')">
<a href="/admin/add-actor">Add actor</a> <br>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/edit-actor">Edit actor</a> <br>
</sec:authorize>

<a href="/actor">Actor</a> <br>

<a href="/list-of-actors">All actors</a> <br>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/list-of-users">All Users</a> <br>
</sec:authorize>

<%-- <iframe width="560" height="315" src="https://www.youtube.com/embed/So4BPR-30mY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
<iframe width="560" height="315" th:src="@{https://www.youtube.com/embed/{url} (url=${article.video})}" frameborder="0" alt="no video attached" allowfullscreen="1"></iframe>
 --%>