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
	<div class="player content">
		<iframe src="http://hdgo.cc/video/t/8way17pqa9p3vxb445prabqh/${movieModel.playerUrl}/" width="610" height="370" border="0" frameborder="0" allowfullscreen></iframe>
	</div>
</div>


