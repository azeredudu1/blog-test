<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>

<table class="table table-hover table-striped table-responsive">
	<tr>
		<th>User name</th>
		<th>Operation</th>


	</tr>
	<tbody>
		<c:forEach items="${users }" var="user">
			<tr>
				<td><a
					href='<spring:url value="/users/${user.id }.html"></spring:url>'>
					<c:out value="${user.name }"></c:out>
					</a></td>
				<td><a
					href='<spring:url value="/users/remove/${user.id }.html"></spring:url>'
					class="btn btn-danger triggerRemove">Remove</a></td>


			</tr>
		</c:forEach>


	</tbody>




</table>
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
				<h4 class="modal-title" id="myModalLabel">Remove user</h4>
			</div>
			<div class="modal-body">Do you really want to remove this user
				?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a class="btn btn-danger removeBtn ">Remove</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
<!--
	//-->
	$(function() {
		$('.triggerRemove').click(function(e) {
			e.preventDefault();
			$('#modalRemove .removeBtn').attr("href", $(this).attr("href"));
			$('#modalRemove').modal();

		});
	});
</script>

