<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<<style>
	.error {
		color: red;
	}
</style>

<a href="/">Home</a> <br>

<form:form action="registration" modelAttribute="userModel" method="POST" >
	<form:errors path="*" cssClass="error"> </form:errors> <br>
	
	First name <form:input path="firstName"/> <br>
	Last name <form:input path="lastName"/> <br>
	E-mail <form:input path="email"/> <br>
	Password <form:password path="password"/> <br>
	Confirm password  <form:password path="passwordConfirmation"/> <br>
	Age <form:select path="age">
			<c:forEach begin="5" end="105" var="userAge">
				<form:option value="${userAge}">${userAge}</form:option>
			</c:forEach>
		</form:select> <br>
	Gender <form:radiobutton path="gender" items="${gender}"/> <br>
	
	<input type="submit" value="Register">


</form:form>