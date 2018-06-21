<%@ include file="/WEB-INF/taglib.jsp" %>

<form:form 
	action="/user/profile/image/upload" 
	method="POST" 
	enctype="multipart/form-data">
	
	Choose profile image:
	<input type="file" name="profileImage"> <br><br>
	<input type="submit" value="Upload">
	
</form:form>