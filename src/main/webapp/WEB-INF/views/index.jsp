<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>
<link rel="stylesheet" href="../../resources/files/bootstrap.css">
<html>

<h1>Latest news from Java world</h1>

<table class="table table-hover table-bordered table-striped">
	<tr>
		<th>Date</th>
		<th>Item</th>
	</tr>
	<c:forEach items="${items }" var="item">
		<tbody>
			<tr>
				<td><c:out value="${item.publishedDate }"></c:out> <br> <c:out
						value="${item.blog.name }"></c:out></td>
				<td><strong> <a href="${item.link }" target="_blank"><c:out
								value="${item.title }"></c:out> <span class="glyphicon glyphicon-share-alt"></span></a>
				</strong><br> ${item.description }</td>

			</tr>


		</tbody>


	</c:forEach>


</table>
</html>