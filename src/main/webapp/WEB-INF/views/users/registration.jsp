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
	
	first name <form:input path="firstName"/> <br>
	last name <form:input path="lastName"/> <br>
	email <form:input path="email"/> <br>
	password <form:password path="password"/> <br>
	password confirmation <form:password path="passwordConfirmation"/> <br>
	age<form:input path="age"/> <br>
<%-- 	<form:radiobutton path="gender"/> <br>
 --%>	
	<input type="submit" value="Register">


</form:form>