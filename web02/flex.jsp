<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.shop.biz.*" %>
<%@page import="com.shop.model.*" %>

<%
	FlexVO flex = (FlexVO)request.getAttribute("flex");
	GarmentVO gar = (GarmentVO)request.getAttribute("garment");
%>

<%
	String gname = request.getParameter("gname");
	int num = 1;
	num = Integer.parseInt(request.getParameter("gcnt"));
	int price =1;
	price = Integer.parseInt(request.getParameter("gprice"));
	int money = price * num;
	
 %>
 <%

	String cid = (String) session.getAttribute("cid");
	String cname = (String) session.getAttribute("cname");
	int ctel = (int) session.getAttribute("ctel");
	String cemail = (String) session.getAttribute("cemail");
	int czip = (int) session.getAttribute("czip");
	String caddr1 = (String) session.getAttribute("caddr1");
	String caddr2 = (String) session.getAttribute("caddr2");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
<script src="../jquery-latest.js"></script>
<link rel="stylesheet" href="../datatables.min.css" />
<script src="../datatables.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
   <div class="container">
    <h2 class="tit">결제내용 보기</h2>
       <form action="../AddFlexCtrl" method="post" onsubmit="return payCheck(this)">
      <table class="table">
         <tr>
            <th class="item1">결제자 아이디</th>
            <td class="item2">
            	
                <input type="text" name="cid" value="<%=cid %>" readonly/>
            </td>
         </tr>
         <tr>
            <th class="item2">결제자 이름</th>
            <td class="item2">
               <input type="text" name="cname" value="<%=cname %>" readonly/><td>
         </tr>
         <tr>
            <th class="item3">결제자 전화번호</th>
            <td class="item2">
            <input type="text" name="ctel" id="ctel" value="<%=ctel %>" readonly/></td>
         </tr>
         <tr>
            <th class="item4">우편번호</th>
            <td class="item2">
            <input type="text" name="czip" id="czip" value="<%=czip %>"/></td>
         </tr>
         <tr>
            <th class="item5">주소</th>
            <td class="item2">
            <input type="text" name="caddr1" id="caddr1" value="<%=caddr1 %>"/></td>
         </tr>
         <tr>
            <th class="item6">상세주소</th>
            <td class="item2">
            <input type="text" name="caddr2" id="caddr2" value="<%=caddr2 %>"/></td>
         </tr>
         <tr>
            <th class="item8">상품</th>
            <td class="item2">  
            <input type="text" name="gname" id="gname" value="<%=gname %>"/></td>
         </tr>
         <tr>
            <th class="item9">수량</th>
            <td class="item2">
            <input type="text" name="bcnt" id="bcnt" value="<%=num %>"/></td>
         </tr>
         <tr>
            <th class="item10">결제 금액</th>
            <td class="item2">
            <input type="text" name="money" id="money" value="<%=money %>"/></td>
         </tr>
								<tr>
					<th><label for="">결제방식</label></th>
					<td>
						<select name="fway" id="paytype">
							<option value="카드">카드</option>
							<option value="계좌이체">계좌이체</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="">결제 번호</label></th>
					<td>
					    <select name="fbank" id="payprop">	
				            <optgroup label="카드" id="payprop0" data-a="0">
				                <option value="신한카드">신한카드</option>
				                <option value="농협카드">농협카드</option>
				                <option value="우리카드">우리카드</option>
				                <option value="롯데카드">롯데카드</option>
				                <option value="현대카드">현대카드</option>
				                <option value="아메리칸익스프레스">아메리칸익스프레스</option>
				                <option value="하나카드">하나카드</option>
				            </optgroup>
				            <optgroup label="계좌이체" id="payprop1" data-a="1" name="faccount">
				                <option value="우리은행" data-val="002-279121-18-311">우리은행</option>
				                <option value="국민은행" data-val="119590-12-799819">국민은행</option>
				                <option value="하나은행" data-val="464-908739-14037">하나은행</option>
				                <option value="외한은행" data-val="921-043726-639">외한은행</option>
				                <option value="시티은행" data-val="453-57359-926-04">시티은행</option>
				                <option value="신한은행" data-val="249-90128-912310">신한은행</option>
				                <option value="농협은행" data-val="108207-64-391366">농협은행</option>
				                <option value="기업은행" data-val="594-166721-97-361">기업은행</option>
				                <option value="우체국" data-val="820833-80-633870">우체국</option>
				                <option value="카카오뱅크" data-val="3333-1234-4321-12">카카오뱅크</option>
				                <option value="토스뱅크" data-val="272-3421-3723-927">토스뱅크</option>
				            </optgroup>
					</select>
				    -
	            	<span id="paymsg1">입금할 계좌 : </span>
	            	<input type="text" name="faccount" id="creditnum" data-b="0" value="" size="60" required />
	            	<span id="paymsg2">, 예금주 : OO쇼핑</span>
		            <input type="text" name="fpw" id="credipw" data-c="0" value="" size="20" placeholder="카드 비밀번호 입력"/>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="결제완료" class="btn btn-primary"/>
		<input type="reset" value="결제취소" class="btn btn-primary"/>
		<button id="check_module" type="button" class="btn btn-primary">결제하기</button>
	</form>
		<script>
		$(function(){
			var t = "0";
			$("optgroup[data-a]").css("display", "none");
			$("#paytype").change(function(){
				t = $(this).val();
				if(t=="카드"){
					$("#payprop0").css("display","block");
					$("#payprop1").css("display","none");
				} else {
					if(t=="계좌이체"){
						$("#payprop1").css("display","block");
						$("#payprop0").css("display","none");
					}
				}
			}).change();
			$("#paymsg1, #paymsg2").css("display","none");
			$("#payprop").change(function(){
				if(t=="계좌이체"){
					$("#creditnum").attr("placeholder","");
					$("#paymsg1, #paymsg2").css("display","inline-block");					
					$("#creditnum").val($(this).val()+", "+($(this).find("option:selected").attr("data-val")));
					$("#creditnum").prop("readonly","true");
					$("#credipw").css("display","none");
				} else {
					$("#creditnum").val("");
					$("#paymsg1, #paymsg2").css("display","none");
					$("#creditnum").removeProp("readonly");
					$("#creditnum").attr("placeholder","결제할 카드번호를 입력하세요");
					$("#credipw").css("display","inline-block");
				}
			});
		});
		</script>

	<script>
	function payCheck(f){
		if(f.complete.value == "yes") {
				f.submit();
		} else {
			alert("결제하기를 하지 않으셨습니다.");
			return false;
		}
		return false;
	}
	</script>
	<script>
	$("#check_module").click(function () {
		$("#complete").val("yes");
		if($("#buyer_email").val == "" || $("#cusid").val == "" || $("#buyer_tel").val == "" || $("#buyer_addr").val == "") {
			alert("결제자에 대한 정보가 모두 입력되지 않았습니다.");
			return false;
		} else {
			$("#complete").val("yes");
		}
		var IMP = window.IMP; // 생략가능
		IMP.init('가맹점식별코드를 넣어주세요');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
			merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		*/
		name: '주문명:결제테스트',
		//결제창에서 보여질 이름
		amount: $("#money").val(),
		//가격
		buyer_email: $("#buyer_email").val(),
		buyer_name: $("#cusid").val(),
		buyer_tel: $("#buyer_tel").val(),
		buyer_addr: $("#buyer_addr").val(),
		buyer_postcode: $("#buyer_postcode").val(),
		m_redirect_url: 'https://www.yourdomain.com/payresult.jsp'
		/*
		모바일 결제시,
		결제가 끝나고 랜딩되는 URL을 지정
		(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		*/
	}, function (rsp) {
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
		});
	});
	</script>
</div>
</body>
</html>