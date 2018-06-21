<%@ include file="/WEB-INF/taglib.jsp" %>

<style>
.content {
 padding: 20px;
 }
.flex-left { 
	display: flex;
    justify-content:flex-start;
    align-items: flex-start;
}
.flex-column {
	display: flex;
	flex-direction: column;
}
ul.submenu > li {
    display: block;
}
ul.menu > li {
    display: block;
}
ul.submenu {
    display: none;
}
ul.menu > li:hover > ul.submenu {
    display: block;
}
</style>

<div class="container flex-column">
	<div class="flex-left">
		<div class="content" style="width:270px">
			<img src="${movieModel.imageUrl}" width="250px">
		</div>
		<div class="content" style="width:100%;"> <br>
			
			<c:forEach items="${movieModel.raiting}" var="raiting">
				<c:choose>
					<c:when test="${movieModel.id == raiting.movie.id}">
						<c:set var="e" value="${raiting.raiting}"/>
						<c:set var="t" value="${t + 1}"/>
					</c:when>
					<c:otherwise>
						<c:set var="e" value="0"/>
					</c:otherwise>			
				</c:choose>
				<c:set var="s" value="${s + e}"/>
			</c:forEach>
			<c:set var="rating" value="${s/t}"/>
			
      		<c:forEach begin="1" end="10" var="star">
      			<c:choose>
      				<c:when test="${ star le rating}">	
      			 		<span class="glyphicon glyphicon-star"></span>
               		</c:when>
      				<c:otherwise>
      					<span class="glyphicon glyphicon-star-empty"></span>
      				</c:otherwise>
      			</c:choose>
      		</c:forEach>
      		<c:if test="${userProfile != null }">
      			<form:form 
				action="updateRating" 
				method="POST" 
				modelAttribute="raitingModel"	
				enctype="multipart/form-data">
					<form:hidden path="id" value="u${userProfile.id}m${movieModel.id}"/>
					<form:hidden path="user" value="${userProfile.id }"/>
					<form:hidden path="movie" value="${movieModel.id}"/>
					Rating: <br> <form:input path="raiting" type="number"/> <br>
						<input type="submit" value="Rate">
					
				</form:form>
			</c:if>
			<p> ${movieModel.description}</p> 
			<p>	Genre: &emsp;
				<c:forEach items="${movieModel.genre}" var="genre">
						<a href="${pageContext.request.contextPath}/list-of-movies/genre-${genre.id}">${genre.genre} &ensp;</a>
				</c:forEach>
			</p>
			<p>	Country: &emsp;
				<c:forEach items="${movieModel.country}" var="country">
					<br> 
					<ul class="menu">
						<li>${country.name} &ensp;
						<ul class="submenu">	
							<li>
								<div class="btn-group" style="margin:0 0 0 -40px">
									<a type="button" class="btn btn-default"
										href="${pageContext.request.contextPath}/list-of-actors/country-${country.id}">
										actors
									</a>
									<a type="button" class="btn btn-default"
										href="${pageContext.request.contextPath}/list-of-movies/country-${country.id}">
										movies
									</a>
								</div>
							</li>
						</ul>
						</li>
					</ul>
				</c:forEach>
			</p>
			<p>	Year: ${movieModel.year}</p>
			<p>	Length: ${movieModel.length} min</p>
			<p>	Age limit: ${movieModel.ageLimit.limit}</p>
		</div>
		<div style="width:350px; heigth:100vh; overflow:auto; padding:30px 0 0; text-align:left">
			<p> Actors: &emsp;
				<c:forEach items="${movieModel.actor}" var="actor">
					<br> <a href="${pageContext.request.contextPath}/actor/${actor.id}">${actor.fullName}</a>
				</c:forEach>
			</p>
		</div>
	</div>
	<sec:authorize access="hasAnyRole('USER', 'ADMIN', 'MODERATOR')">
		<c:choose>
			<c:when test="${ userProfile.age ge movieModel.ageLimit.value}">
				<div class="player content">
					<iframe src="http://hdgo.cc/video/t/8way17pqa9p3vxb445prabqh/${movieModel.playerUrl}/" width="610" height="370" border="0" frameborder="0" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:otherwise>
				<div style="text-align:center;">
					<h4>
					We are sorry, but this movie is not recommended for viewing by your age.
					</h4>
				</div>
			</c:otherwise>
		</c:choose>
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<div style="text-align:center;">
			<h4>
			We are sorry, but only users with confirmed registration can watch online video<br>
			You can register right <a href="/registration">here</a>.
			</h4>
		</div>
	</sec:authorize>
	<sec:authorize  access="hasRole('UNCONFIRMED')">
		<div style="text-align:center;">
			<h4>
			One step left to enjoy watching.<br>
			Please confirm your e-mail address.
			</h4>
		</div>
	</sec:authorize>
</div>


