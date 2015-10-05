<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form commandName="user" cssClass="form-horizontal">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">User registered</div>
	</c:if>
	
	<div class="form-group">
		<label for="userName" class="col-sm-2 control-label">User Name:</label>
		<div class="col-sm-10">
			<form:input path="userName" cssClass="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email:</label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-2">
			<input type="submit" value="Register" class="btn btn-lg btn-primary"/>
		</div>
	</div>
</form:form>