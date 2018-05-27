<%@ include file="/WEB-INF/taglib.jsp" %>
<style>
 .center_div{
 	
    margin: 0 auto;
    width:250px 
}
</style>
		<c:if test="${param.fail}">
			<p style="color: red; text-align:center">Fail to authorize. Please try again</p>
		</c:if>
	
	
	   <form:form action="/login" method="POST" class="center_div text-center">
	
		<input type="text" class="form-control"  name="email" placeholder="Email">
		<input type="password" class="form-control"  name="password" placeholder="Password">
		<input type="submit" class="btn btn-default" value="Log In"> <br>
		<a  class="btn btn-default" Href="/registration">Register</a>
		
      </form:form>