<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>상품 상세</title>
<meta charset="utf-8">
<script type="text/javascript">
var totalAmount
var quantity
var quantityInput

	function Review(){
		return fetch('content/review')
		.then(response => response.json())
		.then(data=>{
			
		})
	}
	
	function cart() {
		if ('${sessionScope.id}' == '') {
			alert('먼저 로그인을 하세요');
			let url = '/member/login';
			url += '?contentsno=${dto.contentsno}';
			//alert(url);
			location.href = url;
			return;
		}
		//카트테이블에 등록하고 등록 확인 창 보여주기 (비동기)
	}
	function orderForm(price) {
		if ('${sessionScope.id}' == '') {
			alert('먼저 로그인을 하세요');
			let url = '/member/login';
			url += '?contentsno=${dto.contentsno}';
			//alert(url);
			location.href = url;
			return;
		}
		console.log('${sessionScope}')
		updateTotalAmount(price)
		getSelectedSize()
		
	}
	function order(){
		//주문서 작성으로 이동 주문생성 (비동기)
		selectedPayment = document.querySelector('input[name="payment"]:checked').value;
                
		let params = new URLSearchParams({id:'${sessionScope.id}', mname:'${sessionScope.mname}', total:totalAmount, payment:selectedPayment, reqtext:document.getElementById('reqtext_input').value})
        console.log(params)
		fetch('/orders/addOrder',{
			method:"POST", body:params,headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        }
		}).then(response => {
			response.text().then(ret => {
				console.log(ret)
			})
		})
	}
	
	function updateTotalAmount(price) {
        // 수량 입력값 가져오기
        var quantityInput = document.getElementById('quantity');
        var quantity = parseFloat(quantityInput.value);
        // 총 결제 금액 계산
        totalAmount = price * quantity;
        // 결과를 화면에 표시
        document.getElementById('totalAmount').innerText = totalAmount; 
        document.getElementById('totalAmount2').innerText = totalAmount; 
        document.getElementById('pcount').innerText = quantityInput.value; 
    }
    
    function getSelectedSize() {
        // 선택된 옵션 요소를 가져옴
        var sizeSelect = document.getElementById('sizeSelect');
        
        // 선택된 옵션의 값 가져오기
        var selectedSize = sizeSelect.options[sizeSelect.selectedIndex].value;
        
        // 가져온 값 확인을 위해 콘솔에 출력
        console.log('선택된 사이즈: ' + selectedSize);
        document.getElementById('psize').innerText = selectedSize; 


    }

</script>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-3">
				<h4>
					<i class="bi bi-box2-heart"></i> 상품 정보
				</h4>
				<img class="img-rounded" src="/contents/storage/${dto.filename}"
					style="width: 250px">
				<div class="caption">
					<p>상품명:${dto.pname}</p>
					<p>${dto.detail }</p>
				</div>
			</div>

			<div class="col-sm-6">
				<h4>
					<i class="bi bi-rulers"></i> 사이즈 및 수량
				</h4>
				<ul class="list-group">
					<li class="list-group-item">사이즈 : <c:choose>
							<c:when test="${dto.cateno==1}">
								<select class="form-select" id="sizeSelect">
									<option selected>사이즈 선택</option>
									<option value="L">Large</option>
									<option value="M">Medium</option>
									<option value="S">Small</option>
								</select>
							</c:when>
							<c:when test="${dto.cateno==2 }">
								<select class="form-select" disabled="disabled" id="sizeSelect">
									<option selected>사이즈 선택</option>
								</select>
							</c:when>
							<c:when test="${dto.cateno==3 }">
								<select class="form-select" id="sizeSelect">
									<option selected>사이즈 선택</option>
									<option value="220">220</option>
									<option value="230">230</option>
									<option value="240">240</option>
									<option value="250">250</option>
									<option value="260">260</option>
								</select>
							</c:when>
						</c:choose>
					<li class="list-group-item">가격 : ${dto.price }
					<li class="list-group-item">재고 : ${dto.stock }
					<li class="list-group-item">수량 : <input type="number"
						name="quantity" id="quantity" min=1 max=${dto.stock } value="1">
					<li class="list-group-item"><a href="javascript:cart()"> <i
							class="bi bi-cart4 fs-5" title="장바구니 담기"></i></a> <a
						href="javascript:orderForm(${dto.price })"> <i
							class="bi bi-bag-heart-fill fs-5" title="주문하기"
							data-bs-toggle="modal" data-bs-target="#exampleModal"></i></a> <a
						href="javascript:history.back()"> <i
							class="bi bi-arrow-return-left fs-5"></i>
					</a>
				</ul>
			</div>
		</div>
		<div id="accordion">

			<div class="card">
				<div class="card-header">
					<a class="btn" data-bs-toggle="collapse" href="#collapseOne">
						Q&A </a>
				</div>
				<div id="collapseOne" class="collapse show"
					data-bs-parent="#accordion">
					<div class="card-body">Lorem ipsum..</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed btn" data-bs-toggle="collapse"
						href="#collapseTwo"> Review </a>
				</div>
				<div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
					<div class="card-body">Lorem ipsum..</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed btn" data-bs-toggle="collapse"
						href="#collapseThree"> Collapsible Group Item #3 </a>
				</div>
				<div id="collapseThree" class="collapse" data-bs-parent="#accordion">
					<div class="card-body">Lorem ipsum..</div>
				</div>
			</div>

		</div>
	</div>
	<div class="modal modal-l fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">주문서</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="card mb-3">
							<div class="card-header">배송지</div>
							<div class="card-body">
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
								<a href="#" class="btn btn-primary">주소 변경</a>
							</div>
						</div>
						<div class="card mb-3">
							<div class="card-header">배송 요청사항</div>
							<div class="card-body">
								<label for="recipient-name" id="reqtext" name="reqtext"
									class="col-form-label"></label> <input type="text"
									id="reqtext_input" class="form-control">
							</div>
						</div>

						<div class="card mb-3">
							<div class="card-header">주문 상품</div>
							<div class="card-body">
								<table class="table table-bordered">
									<img class="img-rounded mb-3 img-responsive center-block"
										src="/contents/storage/${dto.filename}" style="width: 250px">
									<tbody>
										<tr>
											<th scope="row">상품명</th>
											<td colspan="3">${dto.pname}</td>
										</tr>
										<tr>
											<th scope="row">사이즈</th>
											<td colspan="3" id='psize'></td>
										</tr>
										<tr>
											<th scope="row">구매개수</th>
											<td colspan="3" id="pcount"></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
						<div class="card mb-3">
							<div class="card-header">총 결제 금액</div>
							<div class="card-body">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row">총 상품 가격</th>
											<td colspan="3" id="totalAmount"></td>
										</tr>
										<tr>
											<th scope="row">배송비</th>
											<td colspan="3">0</td>
										</tr>
										<tr>
											<th scope="row">할인금액</th>
											<td colspan="3">0</td>
										</tr>
									</tbody>
								</table>
								<hr>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row">총 결제 금액</th>
											<td colspan="3" id="totalAmount2"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="card mb-3">
							<div class="card-header">결제수단</div>
							<div class="card-body">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment"
										id="payment1" checked="checked" value="신용카드"> <label
										class="form-check-label" for="payment1"> 신용카드 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment"
										id="payment2" value="카카오페이"> <label class="form-check-label"
										for="payment2"> 카카오페이 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment"
										id="payment3" value="무통장입금"> <label class="form-check-label"
										for="payment3"> 무통장입금 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment"
										id="payment4" value="PAYCO"> <label class="form-check-label"
										for="payment4"> PAYCO </label>
								</div>
							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="order();"
						data-bs-dismiss="modal">결제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--container-->

</body>
</html>