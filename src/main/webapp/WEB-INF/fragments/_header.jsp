<%@ include file="/WEB-INF/taglib.jsp"%>
<style>
.flex-center {
	display: flex;
	justify-content: space-around; /* 
    align-items: center; */
}

.flex-column {
	display: flex;
	flex-direction: column;
} /*
    justify-content:space-around; 
    align-items: center; */
</style>

<nav class="navbar  navbar-inverse">
	<div class="container-fluid flex-center">
		<div class="collapse navbar-collapse flex-column"
			id="bs-example-navbar-collapse-1" style="width: 40%">
			<div>
				<ul class="nav navbar-nav">
					<li><a href="/">Home</a></li>
					<li><a href="/list-of-movies">Movies</a></li>
					<li><a href="/list-of-actors">Actors</a></li>
					<li><sec:authorize access="isAuthenticated()">
							<a href="/unconfirmed/profile">Profile</a>
						</sec:authorize></li>
				</ul>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
							<a href="/moderator/list-of-users">All Users</a>
						</sec:authorize></li>
					<li><sec:authorize access="hasRole('ADMIN')">
							<a href="/admin/add-movie">Add Movies</a>
						</sec:authorize></li>
					<li><sec:authorize access="hasRole('ADMIN')">
							<a href="/admin/add-actor">Add actor</a>
						</sec:authorize></li>
				</ul>
			</div>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1" style="width: 40%">
			<form action="/list-of-movies/search" method="get"
				class="navbar-form center">
				<input type="text" name="search" placeholder="Find movie"
					class="form-control"> <input type="submit" value="Search"
					class="form-control">
			</form>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1" style="width: 40%">
			<ul>
				<sec:authorize access="!isAuthenticated()">
					<form:form action="/login" method="POST"
						class="nav navbar-nav navbar-right">

						<li><input type="text" class="form-control" name="email"
							placeholder="Email"> <input type="password"
							class="form-control" name="password" placeholder="Password"></li>
						<li><input type="submit" class="btn btn-default"
							value="Log In"> <a href="/registration">Register</a></li>

					</form:form>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form:form action="/logout" method="POST"
						class="nav navbar-nav navbar-right" valign="center">
						<li><c:if test="${ userProfile.imageUrl !=null}">
								<img src="${ userProfile.imageUrl}" height="50px"
									style="margin: 17px 5px 17px 0px" class="image-circle">
							</c:if> <c:if test="${ userProfile.imageUrl ==null}">
								<img
									src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png"
									height="50px" style="margin: 17px 5px 17px 0px"
									class="image-circle">
							</c:if></li>
						<input type="submit" class="btn btn-default" value="Log Out">
					</form:form>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>