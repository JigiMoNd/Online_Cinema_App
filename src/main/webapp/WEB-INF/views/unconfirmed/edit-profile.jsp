<%@ include file="/WEB-INF/taglib.jsp"%>

<h2>Profile</h2>
<p style="font-size: 80%; text-align: right">
	Date of registration: ${ userProfile.createdAt } <br> Role: ${ userProfile.role.role }
</p>
<br>
<table style="width: 100%;">
	<tr>
		<th width=10%></th>
		<th width=40%></th>
		<th width=20%></th>
	</tr>
	<tr valign="top">
		<td align="right">
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">First name:</p>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Last name:</p>
			<p style="padding: 3px 3px 3px 0px; margin: 0px;">Email:</p> <br>
			<p style="padding: 0px 3px 0px 0px; margin: 0px;">Age:</p>
			<p style="padding: 0px 3px 0px 0px; margin: 0px;">Gender:</p>

		</td>
		<td><form:form action="/unconfirmed/edit-profile" method="post"
				modelAttribute="editModel">

				<form:hidden path="id" />
				<form:hidden path="role" />
				<form:hidden path="imageUrl" />

				<c:if test="${ error != null}">
					<span style="color: red;">${error}</span>
				</c:if>

				<form:input path="firstName" />
				<br>

				<form:input path="lastName" />
				<br>

				<form:input path="email" />
				<br>

				<form:hidden path="password" />
				<br>

				<form:select path="age">
					<c:forEach begin="5" end="105" var="userAge">
						<form:option value="${userAge}">${userAge}</form:option>
					</c:forEach>
				</form:select>
				<br>

				<form:radiobuttons path="gender" items="${gender}"
					itemLabel="gender" />
				<br>
				<input type="submit" class="btn btn-default" value="Edit" />

			</form:form></td>
		<td align="center"><sec:authorize
				access="hasAnyRole('USER', 'ADMIN', 'MODERATOR')">
				<c:if test="${ userProfile.imageUrl !=null}">
					<img src="${ userProfile.imageUrl}" height="200px">
				</c:if>
				<c:if test="${ userProfile.imageUrl ==null}">
					<img
						src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png"
						height="200px">
				</c:if>
				<br>
				<br>
				<br>
			</sec:authorize> <sec:authorize access="hasRole('UNCONFIRMED')">
				<img
					src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png"
					height="200px">
				<br>
				<p class="btn-default">
					Please confirm your e-mail<br>to upload profile image
				</p>
				<br>
			</sec:authorize></td>
	</tr>
</table>


