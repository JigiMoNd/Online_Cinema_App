<%@ include file="/WEB-INF/taglib.jsp" %>
<style>
	.error {
		color: red;
	}
</style>

<form:form action="add-actor" method="POST" modelAttribute="actorModel">
	
	Full name: <br> <form:input path="fullName"/> <br>
	Country: <br> <form:select path="country" items="${countries}" itemLabel="name" itemValue="id">
	<form:errors type="country" cssClass="error"/> </form:select> <br>
	Birthday: 	<form:input type="date" path="birthDay"/>
	<form:errors type="date" cssClass="error"/> <br>
	Movie: <br> <form:select path="movie" items="${movies}" itemLabel="name" itemValue="id"> 
	<form:errors type="country" cssClass="error"/> </form:select> <br>
		
	<input type="submit" value="Add actor">


</form:form>