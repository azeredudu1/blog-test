<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>
<html>

<h1>${user.name }</h1>


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
						<th>Title</th>
						<th>Link</th>
					</tr>
					<c:forEach items="${blog.items }" var="item">
						<tbody>
							<tr>
								<td><c:out value="${item.title }"></c:out></td>
								<td><a href="${item.link }"><c:out
											value="${item.link }"></c:out></a></td>
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

	});
</script>

</html>




