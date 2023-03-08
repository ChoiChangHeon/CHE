<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.t-img {
	box-sizing: border-box;
	width: 270;
	margin-right: 20px;
}

.t-img img {
	width: inherit;
}
</style>
<div class="sect">
	<div class="sect-top flex-start">
		<div class="t-img tdleftpp20">
			<img
				src="${pageContext.request.contextPath}/resources/imgfile/${dto.timgn}">
		</div>
		<div class="t-info">
			<h3 class="sub_page_title">${dto.tname}선생님</h3>
			<h5 class="sub_page_stitle">과목 : ${dto.tname }</h5>
			<div class="t-info-cont">
				<p>${dto.tinfo}</p>
			</div>
		</div>
	</div>
	<div class="part">
		<aside>
			<%-- tabs --%>
			<ul class="lnb-tabs nav flex-column">
				<li class="lnb-item nav-item"><a class="nav-link active" href="#tab-1"
					data-toggle="tab" data-bs-target="#tab-1">강좌 소개</a></li>
				<li class="lnb-item nav-item"><a class="nav-link" href="#tab-2"
					data-toggle="tab" data-bs-target="#tab-2">질문 게시판</a></li>
				<li class="lnb-item nav-item"><a class="nav-link"
					href="#tab-3" data-toggle="tab" data-bs-target="#tab-3">수강 후기</a></li>
			</ul>
		</aside>
		<article>
			<div class="tab-content">
				<%-- tab 1 --%>
				<div class="tab-pane fade show in active" id="tab-1">
					<div class="txt-c">
						<h3 class="sub_page_stitle">${dto.tname}선생님의 강좌</h3>
					</div>
					<table class="table1" id="list-table">
						<tbody>
							 <c:forEach var="f" items="${dto.lectures}">
									<tr>
										<td>
											<a href="../lectures/detail?lsnum=${f.lsnum}">
												<div class="list-td">
													<div class="list_info">
														<div class="list_title">
															<h3 class="list_title_text"><span>[${f.lsdiff}]</span>&nbsp;${f.lstitle}</h3>
														</div>
														<div class="list_info_body">
															<div class="list_info_user">
																<span>${dto.tname} 선생님</span>
															</div>
															<div class="list_info_detail">
																<span>${dto.subject}&nbsp;｜&nbsp;${f.cnt}강&nbsp;｜&nbsp;${f.runtime}분</span>
															</div>
														</div>
													</div>
												</div>
											</a>
										</td>
									</tr>
								</c:forEach> 
						</tbody>
					</table>
				</div>
				<%-- tab 2 --%>
				<div class="tab-pane fade" id="tab-2">
					<div class="txt-c">
						<h3 class="sub_page_stitle">질문 게시판</h3>
					</div>
					<table class="table1">
						<colgroup>
							<col width="20%" />
							<col width="60%" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th>작성자</th>
								<th>내용</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${dto3}">
								<tr>
									<td>${e.tqwriter}</td>
									<td>${e.tqcontent }</td>
									<td>${e.tqdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="bottom_btn_wrap">
						<button type="button" id="writeBtn" class="btn btn_primary">글쓰기</button>
					</div>
				</div>
				<%-- tab 3 --%>
				<div class="tab-pane fade" id="tab-3">
					<h3 class="sub_page_stitle">수강 후기</h3>

					<div class="review_wrap">
						<div class="review_box review_box_star">
							<div class="star_num">4.7</div>
							<div class="star_star">★★★★★</div>
							<div class="star_text">총 몇개</div>
						</div>
						<div class="review_box review_box_graph">
							<div class="graph_row graph5">
								<span class="graph_text">5점</span>
								<progress class="graph_bar" max="100" value="60" id="graph5"></progress>
							</div>
							<div class="graph_row graph5">
								<span class="graph_text">4점</span>
								<progress class="graph_bar" max="100" value="15" id="graph4"></progress>
							</div>
							<div class="graph_row graph5">
								<span class="graph_text">3점</span>
								<progress class="graph_bar" max="100" value="3" id="graph3"></progress>
							</div>
							<div class="graph_row graph5">
								<span class="graph_text">2점</span>
								<progress class="graph_bar" max="100" value="7" id="graph2"></progress>
							</div>
							<div class="graph_row graph5">
								<span class="graph_text">1점</span>
								<progress class="graph_bar" max="100" value="5" id="graph1"></progress>
							</div>
						</div>
					</div>

					<div class="comment_list">
						<div class="comment_in">
							<form method="post" action="addComm" id="lrstarForm">
								<input type="hidden" name="lscode" value=""> <input
									type="hidden" name="lswriter" value="">
								<div class="comment_in_area">
									<div class="comment_nik">
										<input type="hidden" name="lrwriter"
											value="${sessionScope.id}">${sessionScope.id}</div>
									<div class="comment_star">
										<fieldset>
											<input type="radio" name="lrstar" value="5" id="rate1">
											<label for="rate1"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
												<path fill="#dee2e6" fill-rule="evenodd"
														d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
														clip-rule="evenodd" />
											</svg>
											</label> <input type="radio" name="lrstar" value="4" id="rate2">
											<label for="rate2"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
												<path fill="#dee2e6" fill-rule="evenodd"
														d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
														clip-rule="evenodd" />
											</svg>
											</label> <input type="radio" name="lrstar" value="3" id="rate3">
											<label for="rate3"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
												<path fill="#dee2e6" fill-rule="evenodd"
														d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
														clip-rule="evenodd" />
											</svg>
											</label> <input type="radio" name="lrstar" value="2" id="rate4">
											<label for="rate4"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
												<path fill="#dee2e6" fill-rule="evenodd"
														d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
														clip-rule="evenodd" />
											</svg>
											</label> <input type="radio" name="lrstar" value="1" id="rate5">
											<label for="rate5"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
												<path fill="#dee2e6" fill-rule="evenodd"
														d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
														clip-rule="evenodd" />
											</svg>
											</label>
										</fieldset>
									</div>
									<div class="comment_cont">
										<textarea name="lrcontent" placeholder="평점을 등록해주세요"></textarea>
									</div>
									<div class="comment_in_button">
										<button type="submit" class="btn btn_line">등록</button>
									</div>
								</div>
							</form>
						</div>

						<ul class="comment_list">

							
									<c:forEach var="a" items="${dto2}">
									<c:forEach var="e" items="${a.lectures}">
									<c:forEach var="g" items="${e.lecturesReview}">
									
										<li class="comment">
											<div class="comment_area">
												<div class="comment_header flex-start">
													<div class="comment_nik">${g.lrwriter}</div>
													<div class="star_wrap ml20">
														<div class="star_box" style="width: 80px;">
															<c:forEach varStatus="i" begin="1" end="${g.lrstar}">
																<svg class="star_icon" data-id="${i.index}">
																	<path fill="#ffc807" fill-rule="evenodd"
																		d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
																		clip-rule="evenodd" /></svg>
															</c:forEach>
															<c:if test="${g.lrstar < 5}">
																<c:forEach varStatus="i" begin="${g.lrstar+1}" end="5">
																	<svg class="star_icon" data-id="${i.index}">
																		<path fill="#dee2e6" fill-rule="evenodd"
																			d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z"
																			clip-rule="evenodd" /></svg>
																</c:forEach>
															</c:if>
														</div>
													</div>
												</div>
												<div class="comment_cont">${g.lrcontent}</div>
												<div class="comment_footer">
													<div class="comment_date">${g.lrdate}</div>
													<div class="comment_button_wrap">
														<button class="btn btn_text">수정</button>
														&nbsp;
														<button class="btn btn_text">삭제</button>
													</div>
												</div>
											</div>
										</li>


									</c:forEach>
									</c:forEach>
									</c:forEach>


						</ul>
					</div>
				</div>
		</article>
	</div>
</div>
<script>
$(function(){
	$('#writeBtn').click(function() {
		location = "../mypage/question?tnum=${dto.tnum}";
	});
	
	let max = $("progress").toArray().map(o => o.value).reduce((max, curr) => max < curr ? curr : max );
	//console.log(max);

	let $graph_bar_id = "";
	$('.graph_bar').each(function(i, element){
		if (element.value == max) {
			$graph_bar_id = element.id;
			$('#'+$graph_bar_id).addClass('maxpro');
		}
	});
});
</script>