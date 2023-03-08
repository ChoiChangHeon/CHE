<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
    <h3 class="sub_page_title">강좌상세보기</h3>
    <table class="table1">
        <thead>
            <c:forEach var="e" items="${dto.lecture}">
            <tr>
                <th rowspan="4"><img src="${pageContext.request.contextPath}/resources/imgfile/${e.limg}" style="width: 150px"></th>
                <th>강의이름</th>
                <th>과목</th>
            </tr>
            <tr>
                <td>${e.ltitle}</td>
                <td>${e.lsubject}</td>
            </tr>
            <tr>
                <th>선생님</th>
                <th>난이도</th>
            </tr>
            <tr>
                <td>${dto.tname}</td>
                <td>${e.ldiff}</td>
            </tr>
            <tr>
                <th>강의 총 시간</th>
                <th>강의 개수</th>
                <th>강의 소개</th>
            </tr>
            <tr>
                <td>${e.lruntime}</td>
                <td>${e.lcount}</td>
                <td>${e.linfo}</td>
            </tr>
            </c:forEach>
        </thead>
    </table>
    <div class="bottom_btn_wrap txt-c">
        <button class="btn btn_primary btn_xs" type="button" id="listBtn">리스트</button>
        <c:if test="${sessionScope.sid == 'admin'}">
            <button class="btn btn_grey btn_xxs" type="button" id="deleteBtn">삭제</button>
        </c:if>
    </div>
</article>
<div class="sect">
	<div class="part" style="height:300px; margin-bottom:20px;">
		<div style="width:620px;">
		
		</div>
		<div style="width:500px;">
			<table class="table1">
				<tr>
					<th>선생님</th>
					<td>{○○○} 선생님</td>
				</tr>
				<tr>
					<th>강의 개수</th>
					<td>20개</td>
				</tr>
				<tr>
					<th>강의 시간</th>
					<td>605분</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="part">
		<article>	
			<div id="myTab">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">강좌 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2">교재 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-3" data-bs-target="#tab-3">강의 구성</a></li>
				</ul>
				<div class="tab-content pt10">
					<div class="tab-pane fade show active in" id="tab-1">
						<p>첫번째 탭</p>
					</div>
					<div class="tab-pane fade in" id="tab-2">
						<p>두번째 탭</p>
					</div>
					<div class="tab-pane fade in" id="tab-3">
						<p>세번째 탭</p>
					</div>
				</div>
			</div>
		</article>
		<aside>
			<h3 class="page_sub_stitle">BEST 강좌</h3>
			<ul>
				<li><i class="bi bi-1-square-fill"></i>&nbsp;단 1%만 아는 비밀 [문학, 독서]</li>
				<li><i class="bi bi-2-square-fill"></i>&nbsp;단 1%만 아는 비밀 [공통, 선택]</li>
				<li><i class="bi bi-3-square-fill"></i>&nbsp;단 1%만 아는 비밀 [언어와 매체]</li>
			</ul>
		</aside>
	</div>
</div>
<script>
    $(function() {
        $('#listBtn').click(function() {
            location = "list";
        });
    });
</script>