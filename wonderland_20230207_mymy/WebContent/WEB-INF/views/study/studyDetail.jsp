<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<input type="hidden" name="stnum" value="${dto.stnum}">
	<input type="hidden" name="sttitle" value="${dto.sttitle}">
	<input type="hidden" name="stpurpose" value="${dto.stpurpose}">
	<input type="hidden" name="stheadcount" value="${dto.stheadcount}">
	<div class="sect-cont">
		<div class="cont">
			<div class="board">
				<div class="board_head">
					<h2 class="board_title">${dto.sttitle}</h2>
					<div class="board_user">${dto.stwriter}</div>
					<div class="board_date">${dto.stdate}</div>
				</div>
				<div class="board_body">
					<div class="board_cont">
						<h3 class="board_stitle"><span class="hash-tag"><i class="bi bi-hash"></i></span>���͵� ����</h3>
						<textarea readonly>${dto.stpurpose}</textarea>
					</div>
					<div class="board_cont">
						<h3 class="board_stitle"><span class="hash-tag"><i class="bi bi-hash"></i></span>�� ����</h3>
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<th>���͵� ���� �ο�</th>
								<td>${dto.stheadcount}��</td>
							</tr>
							<tr>
								<th>���� �Ⱓ</th>
								<td>${dto.startdate} ~ ${dto.enddate}</td>
							</tr>
							<tr>
								<th>���� Ű����</th>
								<td>	
									<ul>
									<c:forEach var="e" items="${dto.keywords}">
										<li class="btn-tag">
											<input type='checkbox' name='keyword' value='"+keyword+"' checked style="display: none;"/>
											<i class="bi bi-hash"></i><span>${e.keyword}</span>
										</li>
									</c:forEach>
									</ul>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="board_footer flex">
					<div class="btn_box">
						<input type="button" value="����" id="upBtn" class="btn btn_sblue btn_xs" />
						<input type="button" value="����" id="delBtn" class="btn btn_outline_sblue btn_xs" />
					</div>
					<div class="btn_box">
						<input type="button" value="�۾���" id="writeBtn" class="btn btn btn_outline_primary btn_xs" />
							<input type="button" value="���" id="listBtn" class="btn btn btn_primary btn_xs" />
					</div>
				</div>
			</div>
		</div>
		<div class="cont">
			<div class="comment_list">
					<h3 class="sub_page_stitle">���͵� ��û�ϱ�</h3>
					<div class="comment_in">
					<form method="post" action="addComm">
						<input type="hidden" name="stcode" value="${dto.stnum}">
						<input type="hidden" name="scwriter" value="${sessionScope.id}">
						<div class="comment_in_area">
							<div class="comment_nik">${sessionScope.id}</div>
							<div class="comment_cont"><textarea name="scpurpose" placeholder="��û ������ �Է��ϼ���"></textarea></div>
							<div class="comment_in_button"><button type="submit" class="btn btn_line btn_xs">���</button></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="cont">
			<ul class="comment_list">
				<c:forEach var="e" items="${dto.studycomm}">
					<li class="comment">
						<div class="comment_area">
							<div class="comment_nik">${e.scwriter}</div>
							<div class="comment_cont"><textarea readonly>${e.scpurpose}</textarea></div>
							<div class="comment_footer">
								<div class="comment_date">${e.scdate}</div>
								<div class="comment_button_wrap">
									<a href="#"><button class="btn btn_sblue btn_xs">����</button></a>&nbsp;
									<a href="#"><button class="btn btn_outline_sblue btn_xs">�ź�</button></a>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</article>
<script>
$(function(){
	$('#upBtn').click(function(){
		location = 'upform?stnum=${dto.stnum}';
	})
	$('#listBtn').click(function(){
		location = 'list';
	});
	$('#writeBtn').click(function(){
		location = 'form';
	});
})
</script>