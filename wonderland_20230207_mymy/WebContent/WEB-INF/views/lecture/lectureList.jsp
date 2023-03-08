<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sect">
	<div class="sect-top">
			<h3 class="sub_page_title">CBS ���� ����Ʈ</h3>
		<div class="srch_area">
			<form class="" role="search">
				<input type="text" class="form-control type1" placeholder="�˻��ϼ���" />
				<button type="submit" class="btn btn_primary btn_xs">����</button>
			</form>
		</div>
	</div>
<!-- aside 2023-01-29 �߰� -->
	<div class="part">
		<aside id="lnb_wrap" class="lnb_wrap">
			<ul class="lnb-tabs lnb_depth1">
				<li class="nav-item">
					<button class="nav-link dep01 lnb_depth1">����</button>
					<ul class="lnb_depth2">
					</ul>
				</li>
				<li class="nav-item">
					<button class="nav-link dep01 lnb_depth1">����</button>
					<ul class="lnb_depth2">
					</ul>
				</li>
				<li class="nav-item">
					<button class="nav-link dep01 lnb_depth1">����</button>
					<ul class="lnb_depth2">
					</ul>
				</li>
			</ul>
		</aside>
		<!-- aside ������� �߰��Ѱ� -->
		<article>
			<!-- ���� ����Ʈ -->
			<table class="table1 lectureList" id="list-table">
				<tbody>
					<c:forEach var="e" items="${list}">
	                	<c:forEach var="f" items="${e.lecture}">
							<tr>
								<td>
									<a href="detail?lnum=${f.lnum}">
										<div class="list-td">
											<div class="list_info">
												<div class="list_title">
													<h3 class="list_title_text"><span>[${f.ldiff}]</span>&nbsp;${f.ltitle}</h3>
												</div>
												<div class="list_info_body">
													<div class="list_info_user">
														<span>${e.tname} ������</span>
													</div>
													<div class="list_info_detail">
														<span>${f.lsubject}&nbsp;��&nbsp;${f.lcount}��&nbsp;��&nbsp;${f.lruntime}��</span>
													</div>
												</div>
											</div>
										</div>
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<div class="bottom_btn_wrap">
				<button class="btn btn_primary btn_xs ml10" id="formBtn">���µ��</button>
			</div>
			<!-- paging -->
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
			    	<li class="page-item"><a class="page-link" href="#">2</a></li>
			    	<li class="page-item"><a class="page-link" href="#">3</a></li>
			    	<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</nav>
			<!-- //paging -->
		</article>
	</div>
</div>
<script>
	$(function() {
		$('#formBtn').click(function() {
			location = "form";
		});
		$('.ck').click(function() {
			$(this).css('background');
			location = "pro.kosmo?cmd=lecture&subcmd=lecdetail"
		});
		$('#lecstudent').click(function() {
			location = "";
		});
		$('#sub1').change(function() {
			$.ajax({
				url : 'pro.kosmo?cmd=lecture&subcmd=ajaxTest&ldiff='
						+ $(this).val(),
				success : function(data) {
					// alert(data);
					$('#teacher').html(data);
				}
			});
		});
		
		// left-nav-bar script �߰� (���ִ� �̰� ��ũ��Ʈ���� 2023-01-29 �߰�)
		$(".dep01").click(function(){
			console.log($(this).next().html());
			$(this).next().empty();
			let subject = $(this).text();
			console.log(subject);
			$.ajax({
				url : '../getTeacher?lsubject='+subject,
				success : function(jsondata){
					console.log(jsondata);
					$.each(jsondata, function(i, elt) {
						console.log("tnum : " + elt.tnum);
						console.log("tname : " + elt.tname);
						console.log("test");
						console.log($(".dep01").next().html());
						$(".dep01")	.next().append('<li><button type="button" class="dep02">'+elt.tname+'</button></li>');
					});
				}
			});
			if ($(this).next(".lnb_depth2").css("display") == "block") {
				$(this).next(".lnb_depth2").css("display", "none");
			} else {
				$(".lnb_depth2").css("display","none");
				$(".lnb_depth3").css("display","none");
				$(this).next(".lnb_depth2").css("display","block");
				$(".dep01").css("color","#111111");
				$(this).css("color", "#322cbd");
			}
			$(".lnb_depth1 button").removeClass("lnbOn");
			
		});
		$(".dep02").click(function(){
			if ($(this).next(".lnb_depth3").css("display") == "block") {
				$(this).next(".lnb_depth3").css("display", "none");
			} else {
				$(".lnb_depth3").css("display","none");
				$(this).next(".lnb_depth3").css("display","block");
			}
			$(".dep02").removeClass("lnbOn");
			$(this).addClass("lnbOn");
		});
		$(".dep03").click(function(){
			$(".dep03").removeClass("lnbOn");
			$(this).addClass("lnbOn");
		});
		// ������� �߰��Ѱ�
	});
</script>