<%@ include file="/WEB-INF/taglib.jsp" %>
<style>
	.error {
		color: red;
	}
</style>
<form:form 
action="add-movie" 
method="POST" 
modelAttribute="movieModel"	
enctype="multipart/form-data">
	
	Title: <br> <form:input path="name"/> <br>
	Year: <br> <form:input path="year"/> <br>
	Country (press "ctrl" to chose few): <br> <form:select path="country"  class="form-control" items="${countries}" itemLabel="name" itemValue="id" >
	<form:errors type="country" cssClass="error"/> </form:select> <br>
	Genre: <form:checkboxes items="${genres}" path="genre"/> <br>
	Description: <br> <form:textarea path="description" class="form-control" rows="3"/> <br>
	Length (minutes): <br> <form:input path="length"/> <br>
	Age limit: <form:radiobuttons path="ageLimit" items="${ageLimit}" itemLabel="limit"/> <br>
	ImageURL: <br><input type="file" name="poster"/> <br>
	PlayerURL: <br> <form:input path="playerUrl"/> <br>
	
	<input type="submit" value="Add movie">


</form:form>
