<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
    <h3 class="sub_page_title">���»󼼺���</h3>
    <table class="table1">
        <thead>
            <c:forEach var="e" items="${dto.lecture}">
            <tr>
                <th rowspan="4"><img src="${pageContext.request.contextPath}/resources/imgfile/${e.limg}" style="width: 150px"></th>
                <th>�����̸�</th>
                <th>����</th>
            </tr>
            <tr>
                <td>${e.ltitle}</td>
                <td>${e.lsubject}</td>
            </tr>
            <tr>
                <th>������</th>
                <th>���̵�</th>
            </tr>
            <tr>
                <td>${dto.tname}</td>
                <td>${e.ldiff}</td>
            </tr>
            <tr>
                <th>���� �� �ð�</th>
                <th>���� ����</th>
                <th>���� �Ұ�</th>
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
        <button class="btn btn_primary btn_xs" type="button" id="listBtn">����Ʈ</button>
        <c:if test="${sessionScope.sid == 'admin'}">
            <button class="btn btn_grey btn_xxs" type="button" id="deleteBtn">����</button>
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
					<th>������</th>
					<td>{�ۡۡ�} ������</td>
				</tr>
				<tr>
					<th>���� ����</th>
					<td>20��</td>
				</tr>
				<tr>
					<th>���� �ð�</th>
					<td>605��</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="part">
		<article>	
			<div id="myTab">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">���� ����</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2">���� ����</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-3" data-bs-target="#tab-3">���� ����</a></li>
				</ul>
				<div class="tab-content pt10">
					<div class="tab-pane fade show active in" id="tab-1">
						<p>ù��° ��</p>
					</div>
					<div class="tab-pane fade in" id="tab-2">
						<p>�ι�° ��</p>
					</div>
					<div class="tab-pane fade in" id="tab-3">
						<p>����° ��</p>
					</div>
				</div>
			</div>
		</article>
		<aside>
			<h3 class="page_sub_stitle">BEST ����</h3>
			<ul>
				<li><i class="bi bi-1-square-fill"></i>&nbsp;�� 1%�� �ƴ� ��� [����, ����]</li>
				<li><i class="bi bi-2-square-fill"></i>&nbsp;�� 1%�� �ƴ� ��� [����, ����]</li>
				<li><i class="bi bi-3-square-fill"></i>&nbsp;�� 1%�� �ƴ� ��� [���� ��ü]</li>
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