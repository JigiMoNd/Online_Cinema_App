<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<a href="/">Home</a> <br>

<form:form action="add-movie" method="POST" modelAttribute="movieModel">
	
	<form:input path="name"/> <br>
	<form:input path="description"/> <br>
	<form:input path="length"/>(minutes) <br>
	<form:input path="imageURL"/> <br>
	
	<input type="submit" value="Add movie">


</form:form>