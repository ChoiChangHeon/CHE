<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="main_promo_zone">
		<div class="recommend">
			<!-- 
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" data-interval="true">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/winter-vacation.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_kor.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_eng.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_math.jpg"></a>
					</div>
				</div>
			</div>
			 -->
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" data-interval="3000">
				<!-- Indicators/dots -->
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="0" class="active"></button>
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="1"></button>
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="2"></button>
				</div>
			
				<!-- The slideshow/carousel -->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/resources/images/main/winter-vacation.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/main/main_kor.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/main/main_eng.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
				</div>
				<!-- Left and right controls/icons -->
				<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>
		</div>
		<div class="event box">
			<div></div>
		</div>
	</div>
	<div class="main_teacher_zone" id="myTab">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#kor" data-bs-target="#kor">����</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#eng" data-bs-target="#eng">����</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#math" data-bs-target="#math">����</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active in" id="kor">
				<ul class="flex">
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
				</ul>
			</div>
			<div class="tab-pane fade" id="eng">
				<ul class="flex">
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
				</ul>
			</div>
			<div class="tab-pane fade" id="math">
				<ul class="flex">
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
					<li><a href="#" class="box"></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main_board_info">
		<div class="preview_board">
			<div class="board_title">
				<a href="notice/list">
					<div class="board_title_link">			
						<span class="title">�Խ���</span>
						<span class="more_btn">more&nbsp;<i class="bi bi-chevron-double-right"></i></span>
					</div>
				</a>
			</div>
			<table class="table">
				<tr><td>����°</td></tr>
				<tr><td>�ι�°</td></tr>
				<tr><td>ù��°</td></tr>
			</table>
		</div>
		<div class="preview_notice">
			<div class="board_title">
				<a href="notice/list">
					<div class="board_title_link">			
						<span class="title">��������</span>
						<span class="more_btn">more&nbsp;<i class="bi bi-chevron-double-right"></i></span>
					</div>
				</a>
			</div>
			<div class="board_content">
				<table class="table">
					<c:forEach var="n" items="${notice}">
						<tr><td>${n.nsubject}</td></tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</article>
<script>
$(function(){
	$('#myTab a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	});
	
	//$('.carousel').carousel();
})
</script>