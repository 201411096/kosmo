<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>   
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
<!--     <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/themify-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<jsp:include page="/header.do"></jsp:include>
    <!-- Header End -->


    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="/BookStore/addBuyList.do" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        <h4>구매 세부사항</h4>
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <label for="name">성함<span>*</span></label>
                                <input type="text" id="name" name="customerName" required='required' title='이름을 입력하세요' value="${customerInfo.customerName }" autocomplete='off'>
                            </div>    
                            <div class="col-lg-12">
                                <label for="postCode">우변번호</label>
                                <input type="text" id="postCode" name="postCode" required='required'>
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                            </div>                       
                            <div class="col-lg-12">
                                <label for="addr">주소<span>*</span></label>
                                <input type="text" id="addr" class="street-first" name="addr">
                                <label for="detailAddr">상세 주소<span>*</span></label>
                                <input type="text" id="detailAddr" name="detailAddr" required='required'>
                            </div>                            
                            <div class="col-lg-6">
                                <label for="phone">전화번호<span>*</span></label>
                                <input type="text" id="phone" name="customerTel" title="전화번호를 입력하세요" required='required' value="${customerInfo.customerTel }">
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>주문내역</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>제품 <span>합계</span></li>
                                    <c:forEach items="${cartList }" var="cartList">
                                    <li class="fw-normal">${cartList.bookName} x ${cartList.buycartlistCnt } <span>${cartList.bookTotalPrice}</span></li>
                                    </c:forEach>                                  
                                   
                                    <li class="total-price">총 금액 <span>${subTotal }</span></li>
                                </ul>
                                <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                           	신용카드
                                            <input type="checkbox" id="pc-check">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="pc-item">
                                        <label for="pc-paypal">
                                         	무통장 입금
                                            <input type="checkbox" id="pc-paypal">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">최종 구매</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    


    <!-- Footer Section Begin -->
    <jsp:include page="/footer.do"></jsp:include>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
<!--     <script src="js/jquery-3.3.1.min.js"></script> -->
<!--     <script src="js/bootstrap.min.js"></script> -->
<!--     <script src="js/jquery-ui.min.js"></script> -->
<!--     <script src="js/jquery.countdown.min.js"></script> -->
<!--     <script src="js/jquery.nice-select.min.js"></script> -->
<!--     <script src="js/jquery.zoom.min.js"></script> -->
<!--     <script src="js/jquery.dd.min.js"></script> -->
<!--     <script src="js/jquery.slicknav.js"></script> -->
<!--     <script src="js/owl.carousel.min.js"></script> -->
<!--     <script src="js/main.js"></script> -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    /* // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    } */
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr").value = extraAddr;
                
                } else {
                    document.getElementById("addr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>
</body>

</html>