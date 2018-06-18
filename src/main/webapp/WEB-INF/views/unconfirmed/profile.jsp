<%@ include file="/WEB-INF/taglib.jsp" %>

<h2> Profile </h2>
<p style="font-size:80%; text-align:right">
Date of registration: ${ userProfile.createdAt } <br>
Role: ${ userProfile.role.role } </p> <br>
<div class="flex-row" style=width:100%;>
	<div style="width:20%; text-align: right;">
		<div style="height:28px;">
			<p style="padding: 3px 3px 3px 0px; margin:0px;" >First name:</p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Last name: </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Email:  </p> 
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Age:  </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 3px 3px 0px; margin:0px;">Gender:  </p>
		</div>
	</div>
	<div style=width:40%;>
		<div style="height:28px;">
	    	<p style="padding: 3px 0px 3px 3px; margin:0px;">${ userProfile.firstName } </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 0px 3px 3px; margin:0px;">${ userProfile.lastName } </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 0px 3px 3px; margin:0px;">${ userProfile.email } </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 0px 3px 3px; margin:0px;">${ userProfile.age } </p>
		</div>
		<div style="height:28px;">
			<p style="padding: 3px 0px 4px 3px; margin:0px;">${ userProfile.gender.gender } </p> 
		</div>
		<div>
			<a href="edit-profile" class="btn btn-default"  style="text-align:right">Edit profile</a>
		</div>
	</div>
	<div style="width:40%; text-align:center;">
		<sec:authorize access="hasAnyRole('USER', 'ADMIN', 'MODERATOR')">
			<img src="${ userProfile.imageUrl}" height="200px">
			<br>
			<a href="/user/profile/image" class="btn btn-default">Upload image</a>
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