<%@ include file="/WEB-INF/taglib.jsp" %>

	<c:url var="firstUrl" value="/list-of-actors?page=0"/>
	<c:url var="lastUrl" value="/list-of-actors?page=${ actorsList.totalPages - 1}"/>
	
	<c:url var="nextUrl" value="/list-of-actors?page=${ currentIndex + 1 }"/>
	<c:url var="prevUrl" value="/list-of-actors?page=${ currentIndex - 1 }"/>
	
<div>
	<div class="flex-row" style="justify-content:space-between">
		<div>
			<ul class="pagination">
				<c:choose>
					<c:when test="${ currentIndex == 0 || currentIndex == nan }">
						<li class="disabled"><a href="#">&lt;&lt;</a></li>
						<li class="disabled"><a href="#">&lt;</a></li>
						<li class="active"><a href="${ firstUrl }">1</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${ firstUrl }">&lt;&lt;</a></li>
						<li><a href="${ prevUrl }">&lt;</a></li>
						<c:if test="${currentIndex le 4}">
							<li> <a href="${ firstUrl }">1</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${ beginIndex }" end="${ endIndex }">
					<c:url var="pageUrl" value="/list-of-actors?page=${ i }"/>
					
					<c:choose>
						<c:when test="${ i == currentIndex }">
							<li class="active"><a href="#">${ i + 1 }</a></li>
						</c:when>
						
						<c:otherwise>
							<c:if test="${currentIndex != nan }">
								<li><a href="${ pageUrl }">${ i + 1 }</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					<c:forEach var="i" begin="${ 0 }" end="${ 4 }">
						<c:if test="${ actorsList.totalPages - 1 == i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/list-of-actors?page=${ e + 1 }" />

										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
										<c:if test="${ actorsList.totalPages > 1 }">
											<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
												<c:url var="pageUr" value="/list-of-actors?page=${ e + 1 }" />
												
												<li><a href="${ pageUr }">${ e + 2 }</a></li>
											</c:forEach>
										</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:if test="${ actorsList.totalPages > 3 }">
						<c:set var="i" value="4" />
						<c:if test="${ currentIndex le i }">
							<c:choose>
								<c:when test="${ currentIndex != 0 }">
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/list-of-actors?page=${ e + 1 }" />
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="e" begin="${ currentIndex }" end="${ i - 1 }">
										<c:url var="pageUr" value="/list-of-actors?page=${ e + 1 }" />
	
										<li><a href="${ pageUr }">${ e + 2 }</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:if>
					
				<c:choose>
					<c:when test="${ currentIndex + 1 == actorsList.totalPages || currentIndex == nan  }">
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
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="width: 40%; text-align:right;">
			<form action="/list-of-actors/search" method="get" class="navbar-form center">
				<input type="text" name="search" placeholder="Find actors" class="form-control"> 
				<input type="submit" value="find actors"	class="form-control">
			</form>
		</div>
	</div>
		<div>
			<div>
				<div class="col-md-12">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th colspan="5" style="text-align:center">List of actors 
									<c:if test="${countryModel != null}">
										of ${countryModel.name} &ensp;
											<a type="button" class="btn btn-default"
												href="${pageContext.request.contextPath}/list-of-movies/country-${countryModel.id}">
												movies
											</a>
									</c:if>
								</th>
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
							<c:if test="${countryModel != null}">
								<c:forEach items="${countryModel.actor}" var="actor">	
									<tr>
										<td style="vertical-align:middle;">
											<a href="${pageContext.request.contextPath}/actor/${actor.id}">${actor.fullName}</a>
										</td>
									 	<td style="vertical-align:middle;">
											${ actor.country.name }
										</td>
										<td style="vertical-align:middle;">
											${ actor.birthDay}
										</td>
										<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
											<td style="vertical-align:middle; width:20%">
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
							</c:if>

							<c:forEach items="${ actorListByPageSize }" var="actor">
								<tr>
									<td style="vertical-align:middle;">
										<a href="${pageContext.request.contextPath}/actor/${actor.id}">${actor.fullName}</a>
									</td>
								 	<td style="vertical-align:middle;">
										${ actor.country.name }
									</td>
									<td style="vertical-align:middle;">
										${ actor.birthDay}
									</td>
									<sec:authorize access="hasAnyRole('ADMIN', 'MODERATOR')">
										<td style="vertical-align:middle; width:20%">
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