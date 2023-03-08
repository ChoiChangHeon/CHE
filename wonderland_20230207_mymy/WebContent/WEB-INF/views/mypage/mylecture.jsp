<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/c3.css">
<script src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>
<div class="sect">
	<div class="part">
		<aside>
			<ul class="lnb-tabs">
				<li class="lnb-item"><a href="#">�� ���� ����</a></li>
				<li class="lnb-item"><a href="#" class="selected">�� ���� ����</a></li>
				<li class="lnb-item"><a href="#">�� ���� ����</a></li>
			</ul>
		</aside>
		<article>
			<div class="sect-top">
				<h3 class="sub_page_title">�� ����</h3>
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
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">�������� ����</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2">����� ����</a></li>
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
										<td>���� ����</td>
										<td>���� ����</td>
										<td colspan="2">�����</td>
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
											<td><b>{��浿}</b><br>������</td>
											<td><b>���Ǽ�</b><br>${e.cnt}��</td>
											<td><b>������</b><br>{30}%</td>
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
										<td>���� ����</td>
										<td>���� ���</td>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="e" items="${list2 }" >
									<tr>
										<td>
											<img src="${pageContext.request.contextPath}/resources/images/dino.png">
												<p><b>{DINO}</b>������</p>
												<p>���� ���� : ${e.lstitle }</p>
										</td>
										<td><b>���� ��</b>
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
					<b>{���̸�}</b> ���� ��������
				</div>
				<table class="table1">
					<thead>
						<tr>
							<td>������</td>
							<td>���� ����</td>
							<td>�ۼ� ��¥</td>
							<td>�亯 ����</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>��浿</td>
							<td><a href="${pageContext.request.contextPath}/web/mypage/mylecture">13:02 �п� �����Ͻ� �κ��� �� ���ذ� �����ʾƿ�.</a></td>
							<td>2022-07-22</td>
							<td>X</td>
						</tr>
						<tr>
							<td>��⸣��</td>
							<td><a href="#">�Ǵ޶����Ű�����</a></td>
							<td>2023-01-28</td>
							<td>O</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="section100">
				<b>{���̸�}</b> ���� ��۳���
			</div>
			<table class="table1">
				<thead>
					<tr>
						<td>������ �� ����</td>
						<td>����</td>
						<td>����</td>
						<td>�ۼ� ��¥</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><b>{OOO}</b>��������<br><b>{OO} ����</b></td>
						<td>������ �ʹ� ģ���ϰ� ���Ҿ�� �����մϴ�!</td>
						<td>�ڡڡڡڡ�</td>
						<td>2023-01-28</td>
					</tr>
					<tr>
						<td><b>{OOO}</b>��������<br><b>{OO} ����</b></td>
						<td>��Ҹ��� �ʹ� Ŀ��</td>
						<td>�ڡڡڡ١�</td>
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
		
		
        $('#target').html("<td><div id='chart'></div></td><td><b>"+"${tname}"+" ������</b><br>"+"${tinfo}"+"</td><td><b>�������� ����</b><br>{15/40}</td><td>�������<br><b>"+"[���or�̵�� �̰ǶǾ�ī��]"+"</b><br><input type='button' value='�ۼ��ϱ�' class='btn btn-primary'></td>")

    let charttitle = 15 / 40 * 100;

    var chart = c3.generate({
        data : {
            columns : [ [ '������', 15 ], [ '�ȵ�����', 25 ], ],
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