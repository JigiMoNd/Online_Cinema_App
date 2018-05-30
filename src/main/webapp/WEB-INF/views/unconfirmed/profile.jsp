<%@ include file="/WEB-INF/taglib.jsp" %>

<h2> Profile </h2>
<p style="font-size:80%; text-align:right">
Date of registration: ${ userProfile.createdAt } <br>
Role: ${ userProfile.role.role } </p> <br>
<table style=width:100%;>
	<tr>
		<th width=10%></th>
		<th width=40%></th>
		<th width=20%></th>
	</tr>
	<tr valign="top">
		<td align="right">
			<p style="padding: 3px 3px 3px 0px; margin:0px;" >First name:</p>
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Last name: </p>
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Email:  </p> <br>
			<p style="padding: 0px 3px 0px 0px; margin:0px;">Age:  </p>
			<p style="padding: 0px 3px 0px 0px; margin:0px;">Gender:  </p>
			
		</td>
		<td>
	    	<p style="padding: 3px 3px 3px 0px; margin:0px;">${ userProfile.firstName } </p>
			
			<p style="padding: 3px 3px 3px 0px; margin:0px;">${ userProfile.lastName } </p>
			
			<p style="padding: 3px 3px 3px 0px; margin:0px;">${ userProfile.email } </p>
			<%-- Password: ${ userProfile.password } --%> <br>
			<p style="padding: 0px 3px 0px 0px; margin:0px;">${ userProfile.age } </p>
			 
			<p style="padding: 0px 3px 7px 0px; margin:0px;">${ userProfile.gender.gender } </p> 
			
			<a href="edit-profile" class="btn btn-default"  style="text-align:right">Edit profile</a>
		</td>
		<td align="center">
			
			<sec:authorize access="hasAnyRole('USER', 'ADMIN', 'MODERATOR')">
				<c:if test="${ userProfile.imageUrl !=null}">
					<img src="${ userProfile.imageUrl}" height="200px">
				</c:if> 
				<c:if test="${ userProfile.imageUrl ==null}">
					<img src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png" height="200px">
				</c:if><br>
				<a href="/user/profile/image" class="btn btn-default">Upload image</a><br>
			</sec:authorize>
			<sec:authorize access="hasRole('UNCONFIRMED')">
				<img src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png" height="200px">
				<br>
				<p class="btn-default">Please confirm your e-mail<br>to upload profile image</p><br>
			</sec:authorize>
		</td>
	</tr>
</table>

