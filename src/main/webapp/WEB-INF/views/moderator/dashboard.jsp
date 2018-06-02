
<sec:authorize access="hasRole('ADMIN')">
<a href="/admin/add-movie">Add Movies</a> <br>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/edit-movie">Edit Movies</a> <br>
</sec:authorize>

<sec:authorize access="hasRole('ADMIN')">
<a href="/admin/add-actor">Add actor</a> <br>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/edit-actor">Edit actor</a> <br>
</sec:authorize>

<a href="/list-of-actors">All actors</a> <br>

<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
<a href="/moderator/list-of-users">All Users</a> <br>
</sec:authorize>