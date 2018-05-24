<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<a href="/">Home</a> <br>

<form:form action="add-movie" method="POST" modelAttribute="movieModel">
	
	Title: <form:input path="name"/> <br>
	Description: <form:input path="description"/> <br>
	Length (minutes):<form:input path="length"/> <br>
	ImageURL<form:input path="imageURL"/> <br>
	
	<input type="submit" value="Add movie">


</form:form>