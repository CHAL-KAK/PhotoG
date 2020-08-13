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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<title>main</title>
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

</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK ${sessionScope.login_user.id}님</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/logout.ck">Logout</a>
					</li>
					<c:if test="${sessionScope.login_user.type eq 'P'}">
					<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/photo_mypage.ck?id=${sessionScope.login_user.id}">MyPage</a>
					</c:if>
					<c:if test="${sessionScope.login_user.type eq 'M'}">
					<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/model_mypage.ck?id=${sessionScope.login_user.id}">MyPage</a>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<%
		String path = application.getContextPath();
	%>

	<div class="wrapper" style="margin: 50px auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="description">
						<h2>Board</h2>
					</div>

					<div class="fresh-table full-color-orange">

						<table id="fresh-table" class="table">
							<thead>
								<th data-field="id" data-sortable="true">Id</th>
								<th data-field="title" data-sortable="true">Title</th>
								<th data-field="maximun_number" data-sortable="true">Maximun
									Number</th>
								<th data-field="hope_date" data-sortable="true">Hope Date</th>
								<th data-field="start_time" data-sortable="true">Start Time</th>
								<th data-field="end_time" data-sortable="true">End Time</th>
								<th data-field="actions">Actions</th>
							</thead>
							<tbody>
								<c:forEach items="${all}" var="b">
									<tr>
										<td><a href="confirmProfile.ck?id=${b.p_id}">${b.p_id}</a></td>
										<td><a href="board_one.ck?seq=${b.brd_seq}">${b.title}</a></td>
										<td>${b.max}</td>
										<td>${b.day}</td>
										<td>${b.start_time}</td>
										<td>${b.end_time}</td>

										<td><c:if test="${sessionScope.login_user.type eq 'M'}">
												<a
													href="<%=path%>/noticeboard/reservation_form.jsp?pid=${b.p_id}&day=${b.day}&seq=${b.brd_seq}">
													reservation </a>
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${sessionScope.login_user.type eq 'P'}">
							<form action="<%=path%>/noticeboard/notice_form.jsp">
								<input type="submit" value="make a list">
						</c:if>
						<input type="button" class="btn btn-primary pull-left"
							value="back" onclick="location.href='<%=path%>'">
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