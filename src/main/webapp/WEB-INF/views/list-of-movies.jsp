<%@ include file="/WEB-INF/taglib.jsp" %>

<div class="containe">
<c:forEach items="${ movies }" var="movie">
<!-- <section class="movies" id="movies">
    <h2>Featured Movies</h2>
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-6">
			<article class="card">
				<header class="title-header">
					<h3>Movie Title</h3>
				</header>
				<div class="card-block">
					<div class="img-card">
						<img src="//placehold.it/300x250" alt="Movie" class="w-100" />
					</div>
					<p class="tagline card-text text-xs-center">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					<a href="#" class="btn btn-primary btn-block"><i class="fa fa-eye"></i> Watch Now</a>
				</div>
			</article>
		</div>
	</div>
</section> -->

	<div class="col-md-3 col-sm-6">
    		<span class="thumbnail">
      			<img src="${ movie.imageUrl }" width="100" >
      			<h4>${ movie.name }</h4>
      			
      			<div class="ratings">
      				<c:forEach begin="1" end="5" var="star">
      					<c:choose>
      						<c:when test="${ star le movie.rating}">	
      					 		<span class="glyphicon glyphicon-star"></span>
                    		</c:when>
      						<c:otherwise>
      							<span class="glyphicon glyphicon-star-empty"></span>
      						</c:otherwise>
       					</c:choose>
       				</c:forEach>
                </div>
      			<p>${ movie.description }</p>
      			<hr class="line">
      			<div class="row">
      				<div class="col-md-6 col-sm-6">
      					<p class="price">$29,90</p>
      				</div>
      				<div class="col-md-6 col-sm-6">
      					<button class="btn btn-success right" > BUY ITEM</button>
      				</div>
      				
      			</div>
    		</span>
  		</div>
  	</c:forEach>
</div>