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
<!-- <link href="http://fonts.googleapis.com/css?family=Roboto:400,700,300" -->
<!-- 	rel="stylesheet" type="text/css"> -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script
	src="https://unpkg.com/bootstrap-table/dist/bootstrap-table.min.js"></script>
	
	
	
<title>NoticeBoard</title>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</style>
</head>
<body>
<%
		String path = application.getContextPath();
	%>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<%=path%>/admin_index.ck">CHAL KAK</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navdrop"
						role="button" data-toggle="dropdown" data-hover="dropdown">User</a>
						<div class="dropdown-menu" aria-labelledby="navdrop">
							<a href="/CHAL-KAK/admin_photographer_list.ck"
								class="dropdown-item">Photographer</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/admin_board_list.ck">전체 게시글 확인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/logout.ck">Logout</a></li>
				</ul>
				</div>
		</div>
	</nav>
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
						<form action="<%=path%>/admin_index.ck">
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