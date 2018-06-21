<%@ include file="/WEB-INF/taglib.jsp" %>
<style>
	.error {
		color: red;
	}
</style>

<form:form 
action="/moderator/edit-movie" 
method="POST" 
modelAttribute="movieModel"	>
	
	<form:hidden path="id" value="${movieModel.id}"/>
	
	Title: <br> <form:input path="name" vlue="${movieModel.name}"/> <br>
	Year: <br> <form:input path="year" vlue="${movieModel.year}"/> <br>
	Country (press "ctrl" to chose few): <br> <form:select path="country"  class="form-control" items="${countries}" itemLabel="name" itemValue="id" >
	<form:errors type="country" cssClass="error"/> </form:select> <br>
<%-- 	Genre: <form:checkboxes items="${genres}" path="genre"  vlue="${movieModel.ganre}"/> <br> --%>
	Description: <br> <form:textarea path="description" class="form-control" rows="3" vlue="${movieModel.description}"/> <br>
	Length (minutes): <br> <form:input path="length" vlue="${movieModel.length}"/> <br>
	Age limit: <form:radiobuttons path="ageLimit" items="${ageLimit}" itemLabel="limit"  vlue="${movieModel.ageLimit}"/> <br>
	<form:hidden path="imageUrl" value="${movieModel.imageUrl}"/>
	ImageURL: <br><input type="file" name="poster"/> <br>
	PlayerURL: <br> <form:input path="playerUrl"  vlue="${movieModel.playerUrl}"/> <br>
	
	<input type="submit" value="Update information">


</form:form>