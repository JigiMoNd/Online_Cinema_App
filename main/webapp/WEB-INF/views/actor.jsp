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
		<div style="width:270px"><%-- 
			<img src="${actorModel.imageUrl}" width="250px"> --%>
		</div>
		<div style="width:100%">
			<h2> ${actorModel.fullName} </h2> <br>
      		<p>
      		Birthday date: ${actorModel.birthDay}
      		</p>
      		<p>	
			Country: ${actorModel.country.name}	
			</p>
		</div>
		<div style="width:350px; heigth:100vh; overflow:auto; padding:30px 0 0; text-align:left" >
			<p> Movies: 
				<c:forEach items="${actorModel.movie}" var="movie">
					<br> <a href="${pageContext.request.contextPath}/movie/${movie.id}">${movie.name}</a>
				</c:forEach>
			</p>
		</div>
	</div>
</div>

