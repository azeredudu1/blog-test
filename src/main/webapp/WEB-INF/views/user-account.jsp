<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>
<link rel="stylesheet" href="../../resources/files/bootstrap.css">

<html>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg "
	data-toggle="modal" data-target="#myModal">New Blog</button>
<form:form commandName="blog" cssClass="form-horizontal blogForm">
	<!-- Modal -->
	<div class="modal fade " id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Blog details</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="name" class="control-label col-sm-2 ">Name:</label>
						<div class="col-sm-6">
							<form:input path="name" cssClass="form-control" />
							<form:errors path="name"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="url" class="control-label col-sm-2 ">Url:</label>
						<div class="col-sm-6">
							<form:input path="url" cssClass="form-control" />
							<form:errors path="url"></form:errors>
						</div>
					</div>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-lg btn-primary" value="Save">
				</div>
			</div>
		</div>
	</div>
</form:form>
<div>

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<c:forEach items="${user.blogs}" var="blog">
			<li><a href="#blog_${blog.id }" data-toggle="tab">${blog.name }</a></li>
		</c:forEach>


	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<c:forEach items="${user.blogs}" var="blog">
			<div role="tabpanel" class="tab-pane" id="blog_${blog.id }">
				<h4>
					<c:out value="${blog.name }"></c:out>
				</h4>
				<p>
					<a href=""><c:out value="${blog.url }"></c:out></a>
				</p>
				<a
					href='<spring:url value="/blog/remove/${blog.id }.html"></spring:url>'
					class="btn btn-danger triggerRemove">remove Blog</a>

				<table class="table table-hover table-bordered table-striped">
					<tr>
						<th>Date</th>
						<th>Item</th>

					</tr>
					<c:forEach items="${blog.items }" var="item">
						<tbody>
							<tr>
								<td><c:out value="${item.publishedDate }"></c:out></td>
								<td><strong> <a href="${item.link }"
										target="_blank"><c:out value="${item.title }"></c:out></a>
								</strong><br> ${item.description } <span class="socialShare pull-right"></span></td>

							</tr>


						</tbody>


					</c:forEach>


				</table>


			</div>
		</c:forEach>
	</div>


</div>
<!-- Boite de Dialogue pour la confirmation de la suppression -->
<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
			</div>
			<div class="modal-body">Do you really want to remove this blog?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a href="" class="btn btn-danger removeBtn">Remove</a>

			</div>
		</div>
	</div>
</div>





<script type="text/javascript">
	$(function() {

		$('.nav-tabs a:first').tab('show') // Select first tab
		$('.triggerRemove').click(function(e) {
			e.preventDefault();
			$('#modalRemove, .removeBtn').attr("href", $(this).attr("href"));
			$('#modalRemove').modal();
		});
		$('.blogForm').validate(
				{
					rules : {
						name : {
							required : true,
							minlength : 1
						},
						url : {

							required : true,
							url : true
						}

					},
					highlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-success').addClass('has-error');

					},
					unhighlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-error').addClass('has-success');

					}
				});


	});
</script>

</html>




