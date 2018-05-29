<%@ include file="/WEB-INF/taglib.jsp" %>
<style>
	.error {
		color: red;
	}
</style>

<form:form action="add-movie" method="POST" modelAttribute="movieModel">
	
	Title: <br> <form:input path="name"/> <br>
	Year: <br> <form:input path="year"/> <br>
	Country (press "ctrl" to chose few): <br> <form:select path="country" items="${countries}" itemLabel="name" itemValue="id">
	<form:errors type="country" cssClass="error"/> </form:select> <br>
	Genre: <form:checkboxes items="${genres}" path="genre"/> <br>
	Description: <br> <form:textarea path="description"/> <br>
	Length (minutes): <br> <form:input path="length"/> <br>
	Age limit: <form:radiobuttons path="ageLimit" items="${ageLimit}" itemLabel="limit"/> <br>
	ImageURL: <br><form:input path="imageURL"/> <br>
	PlayerURL: <br> <form:input path="playerURL"/> <br>
	
	<input type="submit" value="Add movie">


</form:form>