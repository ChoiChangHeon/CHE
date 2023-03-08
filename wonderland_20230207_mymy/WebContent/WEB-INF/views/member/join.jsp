<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="sect">
	<article>	
		<h3 class="sub_page_title">ȸ������</h3>
		<div class="agree_terms">
			<form method="post" action="addStudent" enctype="multipart/form-data"  id="check">
				<table class="table1 type">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>���̵�&nbsp;<span class="red">*</span></td>
						<td>
							<input type="text" name="sid" id="sid" maxlength="13" class="input_txt inp_m type1" placeholder="���̵� �Է��� �ּ���." min="6" max="13" oninput="this.value = this.value.replace( /[��-��|��-��|��-��]/g, '').replace(/(\..*)\./g, '$1');" required >
							<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="sidC" name="sidC">�ߺ�Ȯ��</button>
							<span id="sidtarget"></span>
							<p class="tb_txt_S">
								<span class="red">*</span>&nbsp;����, ���� ��� ���� �ּ� 6��~13��
							</p>
						</td>
					</tr>
					<tr>
						<td>��й�ȣ&nbsp;<span class="red">*</span></td>
						<td>
							<input type="password" name="spwd" id="spwd" maxlength="20" class="input_txt inp_m type1" placeholder="��й�ȣ�� �Է��� �ּ���." required >
							<span id="spwd1target"></span>
							<p class="tb_txt_S"><span class="red">*</span>&nbsp;����, ���� ��� ���� �ּ� 10��~20��</p>
						</td>
					</tr>
					<tr>
						<td>��й�ȣ Ȯ��&nbsp;<span class="red">*</span></td>
						<td><input type="password" name="spwd2" id="spwd2" maxlength="20" class="input_txt inp_m type1" placeholder="��й�ȣ�� �ٽ� �Է��� �ּ���." required />
							<span id="spwd2target"></span></td>
					</tr>
					<tr>
						<td>�̸�&nbsp;<span class="red">*</span></td>
						<td><input type="text" name="sname" id="sname" class="input_txt inp_m type1" placeholder="�̸� �Է��� �ּ���." required /></td>
					</tr>
					<tr>
						<td>�������&nbsp;<span class="red">*</span></td>
						<td><input type="text" name="sbday1" id="sbday1" style="width: 100px;" maxlength="6" class="input_txt inp_m type1"
							placeholder="YYMMDD" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;-&nbsp;
							<input type="text" name="sbday2" id="sbday2" style="width: 30px;" maxlength="1" class="input_txt inp_m type1"
							placeholder="0" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">  
							<span class="red">*</span>&nbsp;�ֹε�Ϲ�ȣ 7�ڸ��� �Է����ּ���
							<span id="sbdaytarget"></span>
						</td>
					</tr>
					<tr>
						<td>�̸��� �ּ�<span class="red">*</span></td>
						<td><input type="text" name="semail" id="semail" class="input_txt inp_m type1" placeholder="E-mail  @  �Է����ּ���." style="width: 500px" required />
							<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="semailC" name="semailC">�̸���Ȯ��</button>
							&nbsp;<span id="semailtarget"></span></td>
					</tr>
					<tr>
						<td>���� ���ε�</td>
						<td>
						<div>
							<div class="col-sm-10">
								<img src="${pageContext.request.contextPath }/resources/images/bassimg.png" id="imgx">
							</div>
							<input type="file" name="mfile" id="mfile"  style=" margin-left: 10px;"/>
							<p><span class="red">*</span> �⺻�̹����� ���Ͻø�  üũ�� �ּ���.  
							<input type="checkbox" id="chkB" ></p>
							<input type="hidden" id="mfileT" name="mfileT" value="/resources/images/bassimg.png" 
							 disabled="disabled">
						</div>
						</td>
					</tr>
				</table>
				<div class="bottom_btn_wrap txt-c">
					<button class="btn btn_grey btn_xs" type="button" id="cancleBtn">���</button>
					<button class="btn btn_primary btn_xs ml10" type="submit">����</button>
				</div>
			</form>
		</div>
	</article>
</div>
<script>
<%-- ============= ���� =============== --%>
let idc = 0;
let pwdc = 0;
let bdayc = 0;
let emailc = 0;

<%-- ============= �̹��� =============== --%>
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

<%-- ============= ���̵� =============== --%>
	$('#sidC').click(function() {
			let idv = $('#sid').val();
			if (idv.length < 6) {
				$('#sidtarget').html('ID�� 6�� �̻��Դϴ�.');
				$('#sidtarget').css('color', 'red');

			}else if(idv.length > 13){
				$('#sidtarget').html('ID�� 13�� ���� �̾�� �մϴ�.');
				$('#sidtarget').css('color', 'red');
			}else if(idv.length === 0){
				$('#sidtarget').html('���̵� �Է� �� �ּ���');
				$('#sidtarget').css('color', 'red');
			} else {
				$.ajax({
					url : '../idChk?sid=' + idv,
					success : function(data) {
						if (data > 0) {
							//alert("�ߺ��Ǵ� ���̵��Դϴ�.");
							$('#sidtarget').html('�ߺ��Ǵ� ���̵��Դϴ�.');
							$('#sidtarget').css('color', 'red');
						} else {
							//alert("��� ������ ���̵��Դϴ�.");
							$('#sidtarget').html('��� ������ ���̵��Դϴ�.');
							$('#sidtarget').css('color', 'blue');
							$('#spwd').focus();
							return idc = 1;
						}
					}
				});
			}
			
		});
	console.log(idc)
<%-- ============= ��й�ȣ  =============== --%>
	$('#spwd').keyup(function() {
		let spwdv = $('#spwd').val();
		let exptext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
		if(!exptext.test(spwdv)){
				$('#spwd1target').html('�ּ� 6��, �ϳ� �̻��� ����, �ϳ��� ���� �� �ϳ��� Ư�� ���� �� �Է��ؾ� �մϴ�.');
				$('#spwd1target').css('color', 'red');
			}else{
				$('#spwd1target').html('��');
				$('#spwd1target').css('color', 'blue');
				$('#spwd2target').html('��й�ȣ�� ��Ȯ�� �� �ּ���.');
				$('#spwd2target').css('color', 'red');
				
			}		
		});
		$('#spwd2').keyup(function() {
			if($('#spwd').val() != $('#spwd2').val()
					&& exptext.test(spwdv)) {
				$('#spwd2target').html('��й�ȣ ��ġ���� ����');
				$('#spwd2target').css('color', 'red');
			} else {
				$('#spwd2target').html('��');
				$('#spwd2target').css('color', 'blue');
				$('#sname').focus();
				return pwdc = 1;
			}
		});

<%-- ============= ������� =============== --%>
		$('#sbday1').keyup(function() {
	
		if($('#sbday1').val().length == 6){
			
			$('#sbdaytarget').html("�ֹε�Ϲ�ȣ �� 1�ڸ�");
			$('#sbdaytarget').css('color', 'red');
			$('#sbday2').focus();
		}else{
			$('#sbdaytarget').html("�ֹε�Ϲ�ȣ 6�ڸ�");
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
				$('#sbdaytarget').html("�ùٸ��� �Է����ּ���");
				$('#sbdaytarget').css('color', 'red');
			}
		});
<%-- ============= �̸��� üũ =============== --%>
	$('#semailC').click(function(){
			let emailv = $('#semail').val();
			let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(!exptext.test(emailv)) {
				$('#semailtarget').html('�̸��������� �ùٸ��� �ʽ��ϴ�.');
				$('#semailtarget').css('color', 'red');
				
			} else{
				$.ajax({
					url : '../emailChk?semail=' + emailv,
					success : function(data) {
						if (data > 0) {
							$('#semailtarget').html('������� �̸��� �Դϴ�.');
							$('#semailtarget').css('color', 'red');
						} else {
							$('#semailtarget').html('��� ������ �̸��� �Դϴ�.');
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
			alert('�ٽ� Ȯ���� �ּ���');
			
			return;
		}
		
		$('#check').submit();	
		
	});

	<%-- =============  =============== --%>
</script>