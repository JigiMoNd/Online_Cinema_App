<%@ include file="/WEB-INF/taglib.jsp" %>

<c:if test="${countryModel != null}">
<h1>sorry, but country with such id do not exist</h1>
</c:if>
<c:if test="${genreModel != null}">
<h1>sorry, but genre with such id do not exist</h1>
</c:if>
<c:if test="${actorModel != null}">
<h1>sorry, but actor with such id do not exist</h1>
</c:if>
<c:if test="${movieModel != null}">
<h1>sorry, but movie with such id do not exist</h1>
</c:if>