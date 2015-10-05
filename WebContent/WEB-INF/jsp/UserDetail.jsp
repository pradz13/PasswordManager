<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>User Name</th>
			<th>Email</th>
			<th>Name</th>
			<th>Role</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${users.userName}</td>
			<td>${users.email}</td>
			<td>${users.name}</td>
			<td>${users.role}</td>
		</tr>
	</tbody>
</table>

<br/>

<h3 class="form-signin-heading">Password Management</h3>

<form:form commandName="passwordDetail" cssClass="form-inline">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Password Details Added</div>
	</c:if>
  <div class="form-group">
    <form:input path="category" cssClass="form-control" placeholder="Category"/>
  </div>
  <div class="form-group">
    <form:input path="loginName" cssClass="form-control" placeholder="Login Name"/>
  </div>
  <div class="form-group">
    <form:password path="password" cssClass="form-control" placeholder="Password"/>
  </div>
  <button type="submit" class="btn btn-default">Add</button>
</form:form>

<br/>

<a href="<spring:url value="/passwordDetails.html"/>">Retrieve Password Details</a>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Category</th>
			<th>Login Name</th>
			<th>Password</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pwdDetails}" var="pwdDetail">
			<tr>
				<td>${pwdDetail.category}</td>
				<td>${pwdDetail.loginName}</td>
				<td>${pwdDetail.password}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>