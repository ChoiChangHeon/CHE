<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="sect">
	<article>	
		<h3 class="sub_page_title">회원가입</h3>
		<div class="agree_terms">
			<form method="post" action="addStudent" enctype="multipart/form-data"  id="check">
				<table class="table1 type">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>아이디&nbsp;<span class="red">*</span></td>
						<td>
							<input type="text" name="sid" id="sid" maxlength="13" class="input_txt inp_m type1" placeholder="아이디를 입력해 주세요." min="6" max="13" oninput="this.value = this.value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-히]/g, '').replace(/(\..*)\./g, '$1');" required >
							<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="sidC" name="sidC">중복확인</button>
							<span id="sidtarget"></span>
							<p class="tb_txt_S">
								<span class="red">*</span>&nbsp;영문, 숫자 모두 포함 최소 6자~13자
							</p>
						</td>
					</tr>
					<tr>
						<td>비밀번호&nbsp;<span class="red">*</span></td>
						<td>
							<input type="password" name="spwd" id="spwd" maxlength="20" class="input_txt inp_m type1" placeholder="비밀번호를 입력해 주세요." required >
							<span id="spwd1target"></span>
							<p class="tb_txt_S"><span class="red">*</span>&nbsp;영문, 숫자 모두 포함 최소 10자~20자</p>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인&nbsp;<span class="red">*</span></td>
						<td><input type="password" name="spwd2" id="spwd2" maxlength="20" class="input_txt inp_m type1" placeholder="비밀번호를 다시 입력해 주세요." required />
							<span id="spwd2target"></span></td>
					</tr>
					<tr>
						<td>이름&nbsp;<span class="red">*</span></td>
						<td><input type="text" name="sname" id="sname" class="input_txt inp_m type1" placeholder="이름 입력해 주세요." required /></td>
					</tr>
					<tr>
						<td>생년월일&nbsp;<span class="red">*</span></td>
						<td><input type="text" name="sbday1" id="sbday1" style="width: 100px;" maxlength="6" class="input_txt inp_m type1"
							placeholder="YYMMDD" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;-&nbsp;
							<input type="text" name="sbday2" id="sbday2" style="width: 30px;" maxlength="1" class="input_txt inp_m type1"
							placeholder="0" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">  
							<span class="red">*</span>&nbsp;주민등록번호 7자리를 입력해주세요
							<span id="sbdaytarget"></span>
						</td>
					</tr>
					<tr>
						<td>이메일 주소<span class="red">*</span></td>
						<td><input type="text" name="semail" id="semail" class="input_txt inp_m type1" placeholder="E-mail  @  입력해주세요." style="width: 500px" required />
							<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="semailC" name="semailC">이메일확인</button>
							&nbsp;<span id="semailtarget"></span></td>
					</tr>
					<tr>
						<td>사진 업로드</td>
						<td>
						<div>
							<div class="col-sm-10">
								<img src="${pageContext.request.contextPath }/resources/images/bassimg.png" id="imgx">
							</div>
							<input type="file" name="mfile" id="mfile"  style=" margin-left: 10px;"/>
							<p><span class="red">*</span> 기본이미지를 원하시면  체크해 주세요.  
							<input type="checkbox" id="chkB" ></p>
							<input type="hidden" id="mfileT" name="mfileT" value="/resources/images/bassimg.png" 
							 disabled="disabled">
						</div>
						</td>
					</tr>
				</table>
				<div class="bottom_btn_wrap txt-c">
					<button class="btn btn_grey btn_xs" type="button" id="cancleBtn">취소</button>
					<button class="btn btn_primary btn_xs ml10" type="submit">다음</button>
				</div>
			</form>
		</div>
	</article>
</div>
<script>
<%-- ============= 변수 =============== --%>
let idc = 0;
let pwdc = 0;
let bdayc = 0;
let emailc = 0;

<%-- ============= 이미지 =============== --%>
$(function() {
	$('#mfile').change(function() {

		if ($(this).val().length > 0) {
			readURL(this);
		}
	});
});
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgx').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
};
$('#chkB').click(function(){
		var target1 = document.getElementById('mfile');
		var target2 = document.getElementById('mfileT');
		if(this.checked){
			target1.disabled = true;
			console.log('off');
			target2.disabled = false;
			console.log('on');
		}else{
			target2.disabled = true;
			console.log('off');
			target1.disabled = false;
			console.log('on');
		}
});

<%-- ============= 아이디 =============== --%>
	$('#sidC').click(function() {
			let idv = $('#sid').val();
			if (idv.length < 6) {
				$('#sidtarget').html('ID는 6자 이상입니다.');
				$('#sidtarget').css('color', 'red');

			}else if(idv.length > 13){
				$('#sidtarget').html('ID는 13자 이하 이어야 합니다.');
				$('#sidtarget').css('color', 'red');
			}else if(idv.length === 0){
				$('#sidtarget').html('아이디를 입력 해 주세요');
				$('#sidtarget').css('color', 'red');
			} else {
				$.ajax({
					url : '../idChk?sid=' + idv,
					success : function(data) {
						if (data > 0) {
							//alert("중복되는 아이디입니다.");
							$('#sidtarget').html('중복되는 아이디입니다.');
							$('#sidtarget').css('color', 'red');
						} else {
							//alert("사용 가능한 아이디입니다.");
							$('#sidtarget').html('사용 가능한 아이디입니다.');
							$('#sidtarget').css('color', 'blue');
							$('#spwd').focus();
							return idc = 1;
						}
					}
				});
			}
			
		});
	console.log(idc)
<%-- ============= 비밀번호  =============== --%>
	$('#spwd').keyup(function() {
		let spwdv = $('#spwd').val();
		let exptext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
		if(!exptext.test(spwdv)){
				$('#spwd1target').html('최소 6자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 를 입력해야 합니다.');
				$('#spwd1target').css('color', 'red');
			}else{
				$('#spwd1target').html('√');
				$('#spwd1target').css('color', 'blue');
				$('#spwd2target').html('비밀번호를 재확인 해 주세요.');
				$('#spwd2target').css('color', 'red');
				
			}		
		});
		$('#spwd2').keyup(function() {
			if($('#spwd').val() != $('#spwd2').val()
					&& exptext.test(spwdv)) {
				$('#spwd2target').html('비밀번호 일치하지 않음');
				$('#spwd2target').css('color', 'red');
			} else {
				$('#spwd2target').html('√');
				$('#spwd2target').css('color', 'blue');
				$('#sname').focus();
				return pwdc = 1;
			}
		});

<%-- ============= 생년월일 =============== --%>
		$('#sbday1').keyup(function() {
	
		if($('#sbday1').val().length == 6){
			
			$('#sbdaytarget').html("주민등록번호 뒤 1자리");
			$('#sbdaytarget').css('color', 'red');
			$('#sbday2').focus();
		}else{
			$('#sbdaytarget').html("주민등록번호 6자리");
			$('#sbdaytarget').css('color', 'red');
		}
		});
		
		$('#sbday2').keyup(function() {
			if($('#sbday2').val()>0 && $('#sbday2').val() < 5){
				$('#sbdaytarget').html("O");
				$('#sbdaytarget').css('color', 'blue');
				$('#semail').focus();
				return bdayc = 1;
				
			}else{
				$('#sbdaytarget').html("올바르게 입력해주세요");
				$('#sbdaytarget').css('color', 'red');
			}
		});
<%-- ============= 이메일 체크 =============== --%>
	$('#semailC').click(function(){
			let emailv = $('#semail').val();
			let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(!exptext.test(emailv)) {
				$('#semailtarget').html('이메일형식이 올바르지 않습니다.');
				$('#semailtarget').css('color', 'red');
				
			} else{
				$.ajax({
					url : '../emailChk?semail=' + emailv,
					success : function(data) {
						if (data > 0) {
							$('#semailtarget').html('사용중인 이메일 입니다.');
							$('#semailtarget').css('color', 'red');
						} else {
							$('#semailtarget').html('사용 가능한 이메일 입니다.');
							$('#semailtarget').css('color', 'blue');
							return emailc = 1;
						}
					}
				});
			}
		});
	<%-- =============  =============== --%>
	$(function() {
		$('#cancleBtn').click(function() {
			location = "../";
		});
	
	
	});
	<%-- =============  =============== --%>
	
	
	$('#msubmit').click(function() {
		if(idc === 1 && pwdc === 1 && bdayc === 1 && emailc === 1){	
			
		}else {
			$('#sid').focus();
			alert('다시 확인해 주세요');
			
			return;
		}
		
		$('#check').submit();	
		
	});

	<%-- =============  =============== --%>
</script>