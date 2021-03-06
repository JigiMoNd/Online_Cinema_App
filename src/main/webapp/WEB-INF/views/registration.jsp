<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.error {
		color: red;
	}
</style>

<form:form action="registration" modelAttribute="userModel" method="POST" >
	<form:errors path="*" cssClass="error"> </form:errors> <br>
	
	First name: <br> <form:input path="firstName"/> <br>
	Last name: <br> <form:input path="lastName"/> <br>
	Email: <br> <form:input path="email"/> <br>
	Password: <br> <form:password path="password"/> <br>
	Confirm password: <br>  <form:password path="passwordConfirmation"/> <br>
	Age: <br> <form:select path="age">
			<c:forEach begin="5" end="105" var="userAge">
				<form:option value="${userAge}">${userAge}</form:option>
			</c:forEach>
		</form:select> <br>
	Gender: <form:radiobuttons  path="gender" items="${gender}" itemLabel="gender" checked="checked" value=" "/> <br>
	<form:hidden path="imageUrl" value="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png"></form:hidden>
	<input type="submit" value="Register">


</form:form>