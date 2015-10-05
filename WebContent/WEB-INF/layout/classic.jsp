<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesex" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<tilesex:useAttribute name="pageName"/>
	<div class="container">
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
					<a class="navbar-brand" href='<spring:url value=""/>'>Password Manager</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<c:url var="logoutUrl" value="j_spring_security_logout"/>
					<ul class="nav navbar-nav">
						<li class="${pageName == 'index' ? 'active' : ''}"><a href='<spring:url value="/index.html"/>'>Home</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${pageName == 'users' ? 'active' : ''}"><a href="<spring:url value="/users.html"/>">Users</a></li>
						</security:authorize>
						<security:authorize access="hasRole('ROLE_USER')">
							<li class="${pageName == 'users' ? 'active' : ''}"><a href="<spring:url value="/account.html"/>">My Account</a></li>
						</security:authorize>
						<li class="${pageName == 'user_register' ? 'active' : ''}"><a href="<spring:url value="/userRegister.html"/>">User Registration</a></li>
						<security:authorize access="!isAuthenticated()">
							<li class="${pageName == 'login' ? 'active' : ''}"><a href="<spring:url value="/login.html"/>">Login</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${pageName == 'logout' ? 'active' : ''}"><a href="<spring:url value="/logout.html"/>">Logout</a></li>
						</security:authorize>
					</ul>
				</div>
			</div>
		</nav>
		<tiles:insertAttribute name="body" />
		<br> <br>

		<center>
			<tiles:insertAttribute name="footer" />
		</center>

	</div>
</body>
</html>