<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/c3.css">
<script src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>
<div class="sect">
	<div class="part">
		<aside>
			<ul class="lnb-tabs">
				<li class="lnb-item"><a href="#">내 정보 수정</a></li>
				<li class="lnb-item"><a href="#" class="selected">내 강의 정보</a></li>
				<li class="lnb-item"><a href="#">내 질문 정보</a></li>
			</ul>
		</aside>
		<article>
			<div class="sect-top">
				<h3 class="sub_page_title">내 강의</h3>
			</div>
			<div class="cont">
				<table class="table table-bordered table23 tableplus23">
				<colgroup>
		            <col width="20%" />
		            <col width="50%" />
		            <col width="15%" />
		            <col width="15%" />
		        </colgroup>
	            <tr id="target">
	
	            </tr>
			</table>
			</div>
			<div class="cont">
				<div class="mylecture">
					<!-- tabs -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">수강중인 강의</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2">종료된 강의</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active in" id="tab-1">
							<table class="table1">
								<colgroup>
									<col width="70%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<thead>
									<tr>
										<td>강의 정보</td>
										<td>수강 상태</td>
										<td colspan="2">진행률</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${list}">
										<tr>
											<td>
												<a href="#" id="${e.lsnum}" class="abc">
													<img src="${pageContext.request.contextPath}/resources/images/icon_com.png"><b>${e.lsinfo }</b>
												</a>
											</td>
											<td><b>{김길동}</b><br>선생님</td>
											<td><b>강의수</b><br>${e.cnt}개</td>
											<td><b>진도율</b><br>{30}%</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade in" id="tab-2">
							<table class="table1">
								<colgroup>
									<col width="85%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<td>강의 정보</td>
										<td>수강 결과</td>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="e" items="${list2 }" >
									<tr>
										<td>
											<img src="${pageContext.request.contextPath}/resources/images/dino.png">
												<p><b>{DINO}</b>선생님</p>
												<p>강의 제목 : ${e.lstitle }</p>
										</td>
										<td><b>강의 수</b>
											<div>{1}/${e.cnt }</div></td>
									</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="cont">
				<div class="section100">
					<b>{내이름}</b> 님의 질문내역
				</div>
				<table class="table1">
					<thead>
						<tr>
							<td>선생님</td>
							<td>질문 내용</td>
							<td>작성 날짜</td>
							<td>답변 여부</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>김길동</td>
							<td><a href="${pageContext.request.contextPath}/web/mypage/mylecture">13:02 분에 말씀하신 부분이 잘 이해가 가질않아요.</a></td>
							<td>2022-07-22</td>
							<td>X</td>
						</tr>
						<tr>
							<td>김기르동</td>
							<td><a href="#">또달라질거같은데</a></td>
							<td>2023-01-28</td>
							<td>O</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="section100">
				<b>{내이름}</b> 님의 댓글내역
			</div>
			<table class="table1">
				<thead>
					<tr>
						<td>선생님 및 강좌</td>
						<td>내용</td>
						<td>별점</td>
						<td>작성 날짜</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><b>{OOO}</b>선생님의<br><b>{OO} 강좌</b></td>
						<td>선생님 너무 친절하고 좋았어요 감사합니다!</td>
						<td>★★★★★</td>
						<td>2023-01-28</td>
					</tr>
					<tr>
						<td><b>{OOO}</b>선생님의<br><b>{OO} 강좌</b></td>
						<td>목소리가 너무 커요</td>
						<td>★★★☆☆</td>
						<td>2023-03-16</td>
					</tr>
				</tbody>
			</table>
		</article>
	</div>
</div>
<script>
$(function(){
	// Tabs
	$(".tab_box .tabs button").click(function() {
		var tab_id = $(this).attr('data-tab');
		$(".tab_box .tabs button").removeClass('on');
		$(".tab_box .tabs_content > li").removeClass('on');
		$(this).addClass('on');
		$("#" + tab_id).addClass('on');
	});
	
	$('.abc').click(function() {
		let $lsnum = $(this).attr('id');
		$.ajax({
			url: '../aa?lsnum=' + $lsnum,
			success: function(jsondata) {
				console.log(jsondata);
				
			}
		});
	});

	/*
	$('#${list[0].lsnum}').click(function() {
		$.ajax({
			url : "../aa?tnum=1",
			success : function(a) {
				console.log(a);
			}
			
		});
		
		
        $('#target').html("<td><div id='chart'></div></td><td><b>"+"${tname}"+" 선생님</b><br>"+"${tinfo}"+"</td><td><b>진행중인 강의</b><br>{15/40}</td><td>수강댓글<br><b>"+"[등록or미등록 이건또어카누]"+"</b><br><input type='button' value='작성하기' class='btn btn-primary'></td>")

    let charttitle = 15 / 40 * 100;

    var chart = c3.generate({
        data : {
            columns : [ [ '들은거', 15 ], [ '안들은거', 25 ], ],
            type : 'donut',
        },
        donut : {
            title : charttitle + "%"
        },
        size : {
            width : 150,
            height : 150

        },
        color : {
            pattern : [ '#1f77b4', '#eaeaea' ],
        },
    });
    });
	*/
})
</script>