<%@ include file="/WEB-INF/taglib.jsp" %>


<nav class="navbar">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li>
        	<a href="/list-of-movies">Movies</a>
        </li>
        <li>
			<a href="/list-of-actors">Actors</a> 
        </li>
        <li class="active">
        	<sec:authorize access="isAuthenticated()">
				<a href="/unconfirmed/profile">Profile 
					<span class="sr-only">(current)</span>
				</a>
			</sec:authorize>
		</li>
      </ul>
      
     <form action="/list-of-movies/search" method="get" class="navbar-form navbar-left">
        
			<input type="text" name="search" placeholder="Find movie" class="form-control" >
	
			<input type="submit" value="Search" class="form-control">
	</form>
        <li class="nav navbar-nav navbar-right">
  		    <sec:authorize access="isAuthenticated()">
				<a href="/moderator/dashboard">Dashboard 
					<span class="sr-only">(current)</span>
				</a>
			</sec:authorize>
		</li>
      <sec:authorize access="!isAuthenticated()">
	     	<form:form action="/login" method="POST" class="nav navbar-nav navbar-right">
			
				<li ><input type="text" class="form-control"   name="email" placeholder="Email">
				<input type="password" class="form-control"  name="password" placeholder="Password"></li>
				<li><input type="submit" class="btn btn-default" value="Log In"> 
				<a href="/registration">Register</a></li>
			
	   		</form:form>
	   </sec:authorize>
	   <sec:authorize access="isAuthenticated()">
	   		<form:form action="/logout" method="POST" class="nav navbar-nav navbar-right" valign="center">
	   			<li>
	   			
	   				<c:if test="${ userProfile.imageUrl !=null}">
						<img src="${ userProfile.imageUrl}" height="50px" style="margin:17px 5px 17px 0px" class="image-circle">
					</c:if> 
					<c:if test="${ userProfile.imageUrl ==null}">
						<img src="https://res.cloudinary.com/jigimond/image/upload/v1527531712/default-user_1.png" height="50px" style="margin:17px 5px 17px 0px" class="image-circle">
					</c:if>
				</li>
	   			<input type="submit" class="btn btn-default"  value="Log Out">
	   		</form:form>
	   </sec:authorize>
	   		
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>