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
</style>

<div class="container flex-column">
	<div class="flex-left">
		<div class="content" style="width:270px">
			<img src="${movieModel.imageUrl}" width="250px">
		</div>
		<div class="content" style="width:100%;">
			<h2> ${movieModel.name} </h2> <br>
      		<c:forEach begin="1" end="10" var="star">
      			<c:choose>
      				<c:when test="${ star le movieModel.rating}">	
      			 		<span class="glyphicon glyphicon-star"></span>
               		</c:when>
      				<c:otherwise>
      					<span class="glyphicon glyphicon-star-empty"></span>
      				</c:otherwise>
      			</c:choose>
      		</c:forEach>
			<p> ${movieModel.description}</p> 
			<p>	Genre: &emsp;
				<c:forEach items="${movieModel.genre}" var="genre">
					${genre.genre} &ensp;
				</c:forEach>
			</p>
			<p>	Country: &emsp;
				<c:forEach items="${movieModel.country}" var="country">
					${country.name} &ensp;
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


