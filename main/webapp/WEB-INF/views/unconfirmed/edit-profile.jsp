<%@ include file="/WEB-INF/taglib.jsp"%>

<h2>Profile</h2>
<p style="font-size: 80%; text-align: right">
	Date of registration: ${ userProfile.createdAt } <br> Role: ${ userProfile.role.role }
</p>
<br>
<div class="flex-row" style="width: 100%;">
	<div style="width: 20%; text-align: right;">
		<div>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">First name:</p>
		</div>
		<div>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Last name:</p>
		</div>
		<div>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Email:</p>
		</div>
		<div>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Age:</p>
		</div>
		<div>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Gender:</p>
		</div>
	</div>
	<div style="width: 40%;">
		<form:form action="/unconfirmed/edit-profile" method="post"
			modelAttribute="editModel">

			<form:hidden path="id" value="${userProfile.id}" />
		<%-- <form:hidden path="createdAt" value="${userProfile.createdAt}" /> --%>
			<form:hidden path="role" value="${userProfile.role}" />
			<form:hidden path="imageUrl" value="${userProfile.imageUrl}" />
			<form:hidden path="password" />

			<c:if test="${ error != null}">
				<span style="color: red;">${error}</span>
			</c:if>

			<div style="padding: 0px 0px 0px 1px; ">
				<form:input path="firstName" value="${userProfile.firstName}" />
			</div>
			<div style="padding: 0px 0px 0px 1px;">
				<form:input path="lastName" value="${userProfile.lastName}" />
			</div>
			<div style="padding: 0px 0px 0px 1px;">
				<form:input path="email" value="${userProfile.email}" />
			</div>
			<div style="padding: 3px 0px 3px 3px;">
				<form:select path="age" >
					<c:forEach begin="5" end="105" var="userAge">
						<form:option value="${userAge}">${userAge}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div style="padding: 0px 0px 0px 3px;">
				<form:radiobuttons path="gender" items="${gender}"
					itemLabel="gender" />
			</div>
			<div>
				<input type="submit" class="btn btn-default" value="Edit" />
			</div>

		</form:form>
	</div>
	<div style="width: 40%; text-align: center;">
		<sec:authorize access="hasAnyRole('USER', 'ADMIN', 'MODERATOR')">
			<img src="${ userProfile.imageUrl}" height="200px">
			<br>
		</sec:authorize>
		<sec:authorize access="hasRole('UNCONFIRMED')">
			<img 
				src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png"
				height="200px">
			<br>
			<p>
				Please confirm your e-mail<br>to upload profile image
			</p>
		</sec:authorize>
	</div>
</div>
