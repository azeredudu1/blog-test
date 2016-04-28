<%@include file="../layout/taglib.jsp"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/files/plugin.css">
<link rel="stylesheet" href="../../resources/files/bootstrap.css">


<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />


<title><tiles:getAsString name="title"></tiles:getAsString></title>
</head>
<body>
	<%-- 	<tilesx:useAttribute name="current" /> --%>
	<div class="container">

		<!-- Static navbar -->
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href='<spring:url value="/"></spring:url>'
					style="padding: 10px;"><img alt="log"
					src="<%=request.getContextPath()%>/resources/files/icon.png"></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="${current == 'index'?'active':'' }"><a
						href='<spring:url value="/"></spring:url>'>Home</a></li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li class="${current == 'users'?'active':'' }"><a
							href='<spring:url value="/users.html"></spring:url>'>Users</a></li>
					</security:authorize>



				</ul>
				<ul class="nav navbar-nav navbar-right">
					<security:authorize access="!isAuthenticated()">

						<li class="${current=='login'?'active':'' }"><a
							href='<spring:url value="/login.html"></spring:url>'><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li class="${current=='register'?'active':'' }"><a
							href='<spring:url value="/register.html"></spring:url>'>Register</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li class="${current == 'account'?'active':'' }"><a
							href='<spring:url value="/account.html"></spring:url>'>My
								account</a></li>
						<li><a href='<spring:url value="/logout"></spring:url>'><span
								class="glyphicon-log-out glyphicon " title="logout"></span> Hi,
								${user.name } </a></li>
					</security:authorize>


				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid --> </nav>



		<tiles:insertAttribute name="body"></tiles:insertAttribute>
		<br> <br>
		<center>
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>


		</center>
	</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/files/plugin.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/files/demo.js"></script>
	
</body>
</html>