<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
<link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
<link href="assets/css/demo.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,700,300"
	rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table/dist/bootstrap-table.min.js"></script>
<title>Member List</title>
<style>
.main {
	
}

.main_common {
	display: inline;
	width: 100px;
	height: 100px;
	border: 1px solid blue;
}
</style>
</head>
<body>

	<%
		String path = application.getContextPath();
	%>
	<div class="wrapper" style="margin: 50px auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="description">
						<h2>Model List</h2>
					</div>

					<div class="fresh-table full-color-orange">
						<table id="fresh-table" class="table">
							<thead>
								<th data-field="id" data-sortable="true">Id</th>
								<th data-field="password" data-sortable="true">Password</th>
								<th data-field="name" data-sortable="true">Name</th>
								<th data-field="gender" data-sortable="true">Gender</th>
								<th data-field="bday" data-sortable="true">BDAY</th>
								<th data-field="kid" data-sortable="true">Kakao Id</th>
								<th data-field="actions">Actions</th>
							</thead>
							<tbody>
								<c:forEach items="${model}" var="m">
									<tr>
										<td><a href="model_mypage.ck?id=${m.m_id}">${m.m_id}</a></td>
										<td>${m.m_password}</td>
										<td>${m.m_name}</td>
										<td>${m.m_gender}</td>
										<td>${m.m_bday}</td>
										<td>${m.m_ka_id}</td>

										<td><a href="deleteModel.ck?seq=${m.model_seq}">delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper=" style="margin: 50px auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="description">
						<h2>Photographer List</h2>
					</div>

					<div class="fresh-table full-color-orange">
						<table id="fresh-table" class="table">
							<thead>
								<th data-field="id" data-sortable="true">Id</th>
								<th data-field="password" data-sortable="true">Password</th>
								<th data-field="name" data-sortable="true">Name</th>
								<th data-field="gender" data-sortable="true">Gender</th>
								<th data-field="bday" data-sortable="true">BDAY</th>
								<th data-field="kid" data-sortable="true">Kakao Id</th>
								<th data-field="actions">Actions</th>
							</thead>
							<tbody>
								<c:forEach items="${photographer}" var="p">
									<tr>
										<td><a href="photo_mypage.ck?id=${p.p_id}">${p.p_id}</a></td>
										<td>${p.p_password}</td>
										<td>${p.p_name}</td>
										<td>${p.p_gender}</td>
										<td>${p.p_bday}</td>
										<td>${p.p_ka_id}</td>
										<td><a href="deletePhotographer.ck?seq=${p.photog_seq}">delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<form action="<%=path%>/admin_index.ck" method="post">
							<input type="submit" value="back">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var $table = $('#fresh-table')
	var $alertBtn = $('#alertBtn')

	window.operateEvents = {
		'click .like' : function(e, value, row, index) {
			alert('You click like icon, row: ' + JSON.stringify(row))
			console.log(value, row, index)
		},
		'click .edit' : function(e, value, row, index) {
			alert('You click edit icon, row: ' + JSON.stringify(row))
			console.log(value, row, index)
		},
		'click .remove' : function(e, value, row, index) {
			$table.bootstrapTable('remove', {
				field : 'id',
				values : [ row.id ]
			})
		}
	}

	function operateFormatter(value, row, index) {
		return [
				'<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
				'<i class="fa fa-heart"></i>',
				'</a>',
				'<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
				'<i class="fa fa-edit"></i>',
				'</a>',
				'<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
				'<i class="fa fa-remove"></i>', '</a>' ].join('')
	}

	$(function() {
		$table.bootstrapTable({
			classes : 'table table-hover table-striped',
			toolbar : '.toolbar',

			search : true,
			showRefresh : true,
			showToggle : true,
			showColumns : true,
			pagination : true,
			striped : true,
			sortable : true,
			pageSize : 8,
			pageList : [ 8, 10, 25, 50, 100 ],

			formatShowingRows : function(pageFrom, pageTo, totalRows) {
				return ''
			},
			formatRecordsPerPage : function(pageNumber) {
				return pageNumber + ' rows visible'
			}
		})
	})
</script>
</html>