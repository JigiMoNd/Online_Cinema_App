<%@ include file="/WEB-INF/taglib.jsp" %>
	
	<c:url var="firstUrl" value="/list-of-movies?page=0"/>
	<c:url var="lastUrl" value="/list-of-movies?page=${ movies.totalPages }"/>
	
	<c:url var="nextUrl" value="/list-of-movies?page=${ currentIndex + 1 }"/>
	<c:url var="prevUrl" value="/list-of-movies?page=${ currentIndex - 1 }"/>
	
	 
	<div class="container">
		<div class="row">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ currentIndex == 0 }">
						<li class="disabled"><a href="#">&lt;&lt;</a></li>
						<li class="disabled"><a href="#">&lt;</a></li>
						<li class="active"><a href="${ firstUrl }">1</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${ firstUrl }">&lt;&lt;</a></li>
						<li><a href="${ prevUrl }">&lt;</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${ beginIndex }" end="${ endIndex }">
					<c:url var="pageUrl" value="/list-of-movies?page=${ i }"/>
					
					<c:choose>
						<c:when test="${ i == currentIndex }">
							<li class="active"><a href="#">${ i + 1 }</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="${ pageUrl }">${ i + 1 }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ currentIndex+1 == movies.totalPages }">
						<li class="disabled"><a href="#">&gt;</a></li>
						<li class="disabled"><a href="#">&gt;&gt;</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${ nextUrl }">&gt;</a></li>
						<li><a href="${ lastUrl }">&gt;&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
<div class="containe">
<c:forEach items="${ moviesByPageSize }" var="movie">
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