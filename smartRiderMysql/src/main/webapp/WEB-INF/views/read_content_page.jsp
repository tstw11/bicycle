<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>게시글 보기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/css/clean-blog.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="./main_page.do">Smart Rider</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="./main_page.do">Home</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						href="./main_page_about.do" role="button" aria-haspopup="true"
						aria-expanded="false">커뮤니티</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="./main_page_about.do">자유 게시판</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						href="./main_page_about.do" role="button" aria-haspopup="true"
						aria-expanded="false">동호회소개</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">동호회 목록</a> <a
								class="dropdown-item" href="#">동호회 등록</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">라이딩 추천
							경로</a></li>
					<li class="nav-item"><c:choose>
							<c:when test="${!empty sessionUserData }">
								<a class="nav-link" href="./logout_process.do">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="./login_page.do">로그인</a>
							</c:otherwise>
						</c:choose></li>

					<li class="nav-item"><c:choose>
							<c:when test="${!empty sessionUserData }">
								<a class="nav-link" href="./track_page.do">주행 기록</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="./join_member_page.do">회원가입</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('resources/img/aaa.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>게시글</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container mt-1">
		<div class="row">
			<div class="col">
				<table class="table table-bordered">
					<colgroup>
						<col class="colW100">
						<col class="colWAuto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="table-secondary" role="alert">글 번호</th>
							<td>${data.b.board_no }</td>
							<th scope="row" class="table-secondary" role="alert">조회수</th>
							<td>${data.b.board_readcount }</td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">작성자</th>
							<td>${data.a.member_nick }</td>
							<th scope="row" class="table-secondary">작성일</th>
							<td><fmt:formatDate value="${data.b.board_writedate }"
									pattern="yyyy-MM-dd"></fmt:formatDate></td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">제목</th>
							<td colspan="3">${data.b.board_title }</td>
						</tr>
						<tr>
							<td colspan="4"><textarea readonly class="form-control"
									name="board_content" rows="20" cols="110">${data.b.board_content }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="container mt-1">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				<div class="carousel-inner">
					<c:forEach items="${data.c }" var="xxx" varStatus="status">
						<c:if test="${status.index == 0} ">
							안녕
							<div class="carousel-item active">
								<img src="/upload/${xxx.file_link }" class="d-block w-100" alt="사진 불러오기 실패">
							</div>
						</c:if>
						<c:if test="${status.index == 1} ">
							<div class="carousel-item">
								<img src="/upload/${xxx.file_link }" class="d-block w-100"
									alt="사진 불러오기 실패">
							</div>
						</c:if>
						<c:if test="${status.index == 2} ">
							<div class="carousel-item">
								<img src="/upload/${xxx.file_link }" class="d-block w-100"
									alt="사진 불러오기 실패">
							</div>
						</c:if>
						<c:if test="${status.index == 3} ">
							<div class="carousel-item">
								<img src="/upload/${xxx.file_link }" class="d-block w-100"
									alt="사진 불러오기 실패">
							</div>
						</c:if>
						<c:if test="${status.index == 4} ">
							<div class="carousel-item">
								<img src="/upload/${xxx.file_link }" class="d-block w-100"
									alt="사진 불러오기 실패">
							</div>
						</c:if>
					</c:forEach>	
				</div>
				<a class="carousel-control-prev" href="#carouselExampleFade"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleFade"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>





		<div class="row">
			<div class="col">
				<c:forEach items="${data.c }" var="xxx" varStatus="status">
					<img src="/upload/${xxx.file_link }" style="max-width: 100%; height: auto;"><br>
					<p>${status.index } </p>
				</c:forEach>
			</div>
		</div>
		

		<c:forEach items="${data.c }" var="xxx" varStatus="status">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				<div class="carousel-inner">
					<c:choose>
						<c:when test="${status.index == 0}">
							<div class="carousel-item active">
								<img src="resources/img/aaa.jpg" class="d-block w-100" alt="...">
							</div>
						</c:when>
						<c:when test="${status.index == 1}">
							<div class="carousel-item item">
								<img src="resources/img/aaa.jpg" class="d-block w-100" alt="...">
							</div>
						</c:when>
						<c:when test="${status.index == 2}">
							<div class="carousel-item item">
								<img src="resources/img/aaa.jpg" class="d-block w-100" alt="...">
							</div>
						</c:when>
						<c:when test="${status.index == 3}">
							<div class="carousel-item item">
								<img src="resources/img/aaa.jpg" class="d-block w-100" alt="...">
							</div>
						</c:when>
					</c:choose>
<!-- 					<div class="carousel-item"> -->
<!-- 						<img src="resources/img/about.jpg" class="d-block w-100" alt="..."> -->
<!-- 					</div> -->
<!-- 					<div class="carousel-item"> -->
<!-- 						<img src="resources/img/bike_a.jpg" class="d-block w-100" alt="..."> -->
<!-- 					</div> -->
				</div>
				<a class="carousel-control-prev" href="#carouselExampleFade"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleFade"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</c:forEach>

























		<br> <a href="./main_page_about.do">목록으로</a>

		<c:if
			test="${!empty sessionUserData && sessionUserData.member_no == data.b.member_no }">
			<a href="./delete_content_process.do?board_no=${data.b.board_no }">삭제</a>
			<a href="./update_content_page.do?board_no=${data.b.board_no }">수정</a>
		</c:if>



	</div>



	<hr>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2020</p>
				</div>
			</div>
		</div>
	</footer>




	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

</body>
</html>