<%@ include file="/WEB-INF/taglib.jsp"%>
<style>
.flex-row {
	padding: 5px 0 0;
	justify-content: space-between;
	text-align: center;
}

.ratings {
	text-align: center;
}
</style>

<div class="flex-row">
	<div style="width: 100%">


		<c:url var="firstUrl" value="/search?page=0" />
		<c:url var="lastUrl" value="/search?page=${ movies.totalPages - 1}" />

		<c:url var="nextUrl" value="/search?page=${ currentIndex + 1 }" />
		<c:url var="prevUrl" value="/search?page=${ currentIndex - 1 }" />


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
						<c:url var="pageUrl" value="/search?page=${ i }" />

						<c:choose>
							<c:when test="${ i == currentIndex }">
								<li class="active"><a href="#">${ i + 1 }</a></li>
							</c:when>

							<c:otherwise>
								<li><a href="${ pageUrl }">${ i + 1 }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:forEach var="i" begin="${ beginIndex }" end="${ 4 }">
						<c:if test="${ studentsList.totalPages - 1 == i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />

										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />

										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:if test="${ studentsList.totalPages - 1 > 4 }">
						<c:set var="i" value="4" />
						<c:if test="${ currentIndex le i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />
	
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:if>

					<c:choose>
						<c:when test="${ currentIndex + 1 == movies.totalPages }">
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
		</div>
	</div>
	<div style="width: 50%">


		<c:url var="firstUrl" value="/search?page=0" />
		<c:url var="lastUrl" value="/search?page=${ movies.totalPages - 1 }" />

		<c:url var="nextUrl" value="/search?page=${ currentIndex + 1 }" />
		<c:url var="prevUrl" value="/search?page=${ currentIndex - 1 }" />


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
						<c:url var="pageUrl" value="/search?page=${ i }" />

						<c:choose>
							<c:when test="${ i == currentIndex }">
								<li class="active"><a href="#">${ i + 1 }</a></li>
							</c:when>

							<c:otherwise>
								<li><a href="${ pageUrl }">${ i + 1 }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:forEach var="i" begin="${ beginIndex }" end="${ 4 }">
						<c:if test="${ studentsList.totalPages - 1 == i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />

										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />

										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:if test="${ studentsList.totalPages - 1 > 4 }">
						<c:set var="i" value="4" />
						<c:if test="${ currentIndex le i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/search?page=${ e + 1 }" />
	
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:if>

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
		</div>
	</div>
</div>
<div class="flex-row">
	<div>
		<div class="containe">
			<c:forEach items="${ moviesByPageSize }" var="movie">

				<div class="col-md-3 col-sm-6">
					<div class="thumbnail" style="height: 290px;">
						<div class="flex-row">
							<div>
								<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
									<a type="button" class="btn btn-primary"
										href="${pageContext.request.contextPath}/moderator/edit-movie/${movie.id}">
										<i class="glyphicon glyphicon-pencil"></i>
									</a>
								</sec:authorize>
							</div>
							<div>
								<img src="${ movie.imageUrl }" width="100">
							</div>
							<div>
								<sec:authorize access="hasRole('ADMIN')">
									<a type="button" class="btn btn-danger"
										href="${pageContext.request.contextPath}/admin/delete-movie/${movie.id}">
										<i class="glyphicon glyphicon-remove-circle"></i>
									</a>
								</sec:authorize>
							</div>
						</div>
						<div class="flex-row">
							<div style="width: 50%">
								<h4>${ movie.name }</h4>
							</div>
							<div style="width: 50%" class="col-md-6 col-sm-6">
								<a href="${pageContext.request.contextPath}/movie/${movie.id}"
									class="button btn btn-success right">Watch now</a>
							</div>
						</div>
						<div class="ratings">
							<c:forEach begin="1" end="10" var="star">
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
						<div style="height: 60px; overflow: auto">${ movie.description }</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



	<div style="width: 50%">
		<div>
			<div class="col-md-12">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th colspan="5" style="text-align: center">List of actors</th>
						</tr>
						<tr>
							<th>Full name</th>
							<th>Country</th>
							<th>Birthday</th>
							<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
								<th></th>
							</sec:authorize>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ actorListByPageSize }" var="actor">
							<tr>
								<td style="vertical-align: middle;"><a
									href="${pageContext.request.contextPath}/actor/${actor.id}">${actor.fullName}</a>
								</td>
								<td style="vertical-align: middle;">${ actor.country.name }
								</td>
								<td style="vertical-align: middle;">${ actor.birthDay}</td>
								<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
									<td style="vertical-align: middle; width: 20%">
										<div class="btn-group">
											<a type="button" class="btn btn-primary"
												href="${pageContext.request.contextPath}/moderator/edit-actor/${actor.id}">
												<i class="glyphicon glyphicon-pencil"> Edit</i>
											</a>
											<sec:authorize access="hasRole('ADMIN')">
												<a type="button" class="btn btn-danger"
													href="${pageContext.request.contextPath}/admin/delete-actor/${actor.id}">
													<i class="glyphicon glyphicon-remove-circle"> Delete</i>
												</a>
											</sec:authorize>
										</div>
									</td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>