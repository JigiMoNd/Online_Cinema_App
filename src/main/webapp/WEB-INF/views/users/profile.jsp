<%@ include file="/WEB-INF/taglib.jsp" %>

<h2> User Profile </h2>

First name: ${ userProfile.firstName } <br>
Last name: ${ userProfile.lastName } <br>
<c:if test="${ userProfile.imageUrl !=null}">
<img src="${ userProfile.imageUrl}" width="300px">
</c:if> <br>
<a href="/users/profile/image"> Upload profile Image </a><br><br>
Email: ${ userProfile.email } <br>
Password: ${ userProfile.password } <br>
Role: ${ userProfile.role.role } <br><br>
Age: ${ userProfile.age } <br> 
Date of registration: ${ userProfile.createdAt } <br> 
Gender: ${ userProfile.gender } <br> 

