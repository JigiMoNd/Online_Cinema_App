<%@ include file="/WEB-INF/taglib.jsp" %>

<h2> Edit Profile </h2>

<p style="font-size:80%; text-align:right">
Date of registration: ${ userProfile.createdAt } <br>
Role: ${ userProfile.role.role } </p> <br>

<form:form action="/users/edit-profile" method="post" modelAttribute="editModel">  

<form:hidden path = "id"/>
<form:hidden path = "role"/>

<c:if test="${ error != null}">
	<span style="color:red;">${error}</span>
</c:if>

First name: <form:input path="firstName"/> <br>

Last name: <form:input path="lastName"/> <br>

<c:if test="${ userProfile.imageUrl !=null}">
	<img src="${ userProfile.imageUrl}" height="200px">
</c:if> 
<c:if test="${ userProfile.imageUrl ==null}">
	<img src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png" height="200px">
</c:if>

<a href="/users/profile/image" class="btn btn-default"  style="align-items:right; font-size:80%">
 U<br>p<br>l<br>o<br>a<br>d<br><br>I<br>m<br>a<br>g<br>e 
</a> <br><br>

Email:  <form:input path="email"/> <br>

<form:hidden path="password"/> <br>

Age: <form:select path="age">
			<c:forEach begin="5" end="105" var="userAge">
				<form:option value="${userAge}">${userAge}</form:option>
			</c:forEach>
		</form:select> <br>
		
Gender: <form:radiobuttons  path="gender" items="${gender}" itemLabel="gender"/> <br>
	<input type="submit" value="Edit"/>
	 
</form:form>
