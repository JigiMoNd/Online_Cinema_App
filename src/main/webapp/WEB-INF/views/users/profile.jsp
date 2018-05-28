<%@ include file="/WEB-INF/taglib.jsp" %>

<h2> User Profile </h2>
<p style="font-size:80%; text-align:right">Date of registration: ${ userProfile.createdAt }<br>
Role: ${ userProfile.role.role } </p><br>

First name: ${ userProfile.firstName } <br>
Last name: ${ userProfile.lastName } <br>
<c:if test="${ userProfile.imageUrl !=null}">
<img src="${ userProfile.imageUrl}" height="200px">
</c:if> 
<c:if test="${ userProfile.imageUrl ==null}">
<img src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png" height="200px">
</c:if><br><br>
Email: ${ userProfile.email } <br>
<%-- Password: ${ userProfile.password } --%> <br>
Age: ${ userProfile.age } <br> 
Gender: ${ userProfile.gender.gender } <br> 

<a href="edit-profile" class="btn btn-default"  style="text-align:right">Edit profile</a>
