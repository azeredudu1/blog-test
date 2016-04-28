<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>
<html>
<form:form commandName="user"
	cssClass="form-horizontal registrationForm">
	<c:if test="${success eq true }">
		<div class="alert alert-success">Registration successfuly</div>


	</c:if>
	<div class="form-group">
		<label for="name" class="control-label col-sm-2 ">Name:</label>
		<div class="col-sm-6">
			<form:input path="name" cssClass="form-control" />
			<form:errors path="name"></form:errors>
		</div>

	</div>
	<div class="form-group ">
		<label for="email" class="control-label col-sm-2">Email:</label>
		<div class="col-sm-6">
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email"></form:errors>
		</div>

	</div>
	<div class="form-group ">
		<label for="password" class="control-label col-sm-2 ">Password:</label>
		<div class="col-sm-6">
			<form:password path="password" cssClass="form-control" />
			<form:errors path="password"></form:errors>
		</div>

	</div>
	<div class="form-group">
		<label for="password" class="control-label col-sm-2">Confirm:</label>
		<div class="col-sm-6">
			<input type="password" name="password_again" id="password_again"
				class="form-control">
		</div>

	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-6">
			<input type="submit" class="btn btn-lg btn-primary submit"
				value="Save">

		</div>
	</div>





</form:form>
<script type="text/javascript">
	$(function() {
		$('.registrationForm')
				.validate(
						{
							rules : {
								username : {
									required : true,
									minlength : 3,
									remote : {
										url : "<spring:url value='/inscription/available' />",
										type : "get",
										data : {
											username : function() {
												return $("#username").val();

											}

										}

									}

								},
								email : {
									required : true,
									email : true

								},
								password : {
									required : true,
									minlength : 5

								},
								password_again : {
									required : "",
									minlength : 5,
									equalTo : "#password"
								}

							},
							highlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-success').addClass('has-error');

							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error').addClass('has-success');

							},
							messages : {
								username : {
									remote : "Such username already exists!"
								}
							}
						});

	});
</script>


</html>