/*
함수
	ㄴ getCustomerVOAndSetCustomerVO : 사용자의 정보를 받아옴
		ㄴ 내부적으로 reConstructLoginPart를 부름
	ㄴ reConstructLoginPart : 로그아웃 상태시에는 로그인버튼, 로그인 상태시에는 로그아웃버튼, 관리자인 경우 관리화면으로 이동 버튼을 구성하는 함수
	ㄴ reloadCartList : 화면 우측 상단에 있는 장바구니를 갱신하는 함수
		ㄴ 내부적으로 makeCartList를 부름
	ㄴ makeCartList : db에서 가져온 데이터를 html로 구성하는 함수
		ㄴ 내부적으로 로그인 상태인 경우에 makeCartListForm를 부름으로서 화면을 구성해줌
		ㄴ 로그인 상태가 아니라면 그냥 비워둠
	ㄴ makeCartListForm : db에서 가져온 데이터를 html로 구성하는 함수
	ㄴ listSearchKeyUpEvent : 검색창 키업이벤트 발생시 검색어에 해당하는 도서 목록을 가져오는 함수
	ㄴ makeSearhResultBox : listSearchKeyUpEvent에서 받아온 데이터들을 검색 목록을 구성해주는 함수
실행부분
	ㄴ listSearchKeyUpEvent 연결
	ㄴ reloadCartList를 2초마다 부름
	ㄴ 최초에 화면 로딩시 getCustomerVOAndSetCustomerVO를 실행
	ㄴ 2초마다 getCustomerVOAndSetCustomerVO 실행
*/
$(function(){
	$('#listSearch').on('keyup', listSearchKeyUpEvent);
	setInterval(reloadCartList, 2000);
	getCustomerVOAndSetCustomerVO();
	setInterval(getCustomerVOAndSetCustomerVO, 2000);
});
//2초마다 불리는 함수, 사용자 정보를 받아옴
function getCustomerVOAndSetCustomerVO(){
	$.ajax({
		type : 'post',
		url : 'getLoginCustomerVO.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		dataType : 'json',
		success : function(resultData){
			console.log(resultData.customerVO);
			reConstructLoginPart(resultData);
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function reConstructLoginPart(resultData){
	$('.header-top .container .ht-right').empty();
	if(resultData.customerVO==null){
		$('.header-top .container .ht-right').append('<a href="/BookStore/moveToLogin.do" class="login-panel"><i class="fa fa-user"></i>Login</a>');
	}else if(resultData.customerVO!=null){
		
		$('.header-top .container .ht-right').append('<a href="/BookStore/logout.do" class="login-panel"><i class="fa fa-user"></i>Logout</a>');
		if(resultData.customerVO.customerFlag===0){
//			$('.header-top .container .ht-right').append('&nbsp<a href="/BookStore/admin/dashboard.do" class="login-panel">관리화면</a>');
			$('.header-top .container .ht-right').append('&nbsp<a href="/BookStore/admin/dashboard.do" class="login-panel">관리화면&nbsp&nbsp&nbsp&nbsp&nbsp</a>');
		}	
	}
}

//2초마다 불리는 함수, 장바구니 목록을 갱신
function reloadCartList(){
	$.ajax({
		type:'post',
		url:'reloadCartlist.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		dataType : 'json',
		success : function(resultData){
			makeCartList(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	})
}
//장바구니 목록을 받아서 html요소를 구성해줌
function makeCartList(resultData){
	if(resultData===null){
		$('.cartListNumber').text("");
		$('.cartListTotalPrice').text("");
		$('.cart-price').find('span').text("");
		$('.cart-icon').find('tbody').empty();		
	}else{
		$('.cartListNumber').text(resultData.cartListSize);
		$('.cartListTotalPrice').text(resultData.cartListTotalPrice);
		$('.cart-price').find('span').text(resultData.cartListTotalPrice);
		makeCartListForm(resultData)
	}		
}
function makeCartListForm(resultData){
	$('.cart-icon').find('tbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdSiPicPrefix = '<td class="si-pic">';
	var tdSuffix = '</td>'
	var imgPrefix = '<img src="img/select-product-1.jpg" alt="">';
	var tdSiTextPrefix = '<td class="si-text">';
	var divProductSelectedPrefix = '<div class="product-selected">';
	var pCartListPriceAndCntPrefix = '<p class="cartListPriceAndCnt">';
	var pSuffix = '</p>';
	var h6Prefix = '<h6>';
	var h6Suffix = '</h6>';
	var aTagPrefix = '<a href="/BookStore/productView.do?bookId=';
	var aTagSuffix1 = '">';
	var aTagSuffix2 = '</a>';
	var divSuffix = '</div>';
	var tdAndITag = '<td class="si-close"><i class="ti-close"></i></td>';
	var listContent = '';
	for( var i=0; i<resultData.cartListSize; i++ ){
		listContent = trPrefix +
					  tdSiPicPrefix + imgPrefix + tdSuffix + 
					  tdSiTextPrefix + divProductSelectedPrefix +
					  pCartListPriceAndCntPrefix + resultData.cartList[i].bookSaleprice + ' x ' + resultData.cartList[i].buycartlistCnt + pSuffix +
					  h6Prefix + aTagPrefix + resultData.cartList[i].bookId + aTagSuffix1 + resultData.cartList[i].bookName + aTagSuffix2 + h6Suffix +
					  divSuffix +
					  tdSuffix + 
					  tdAndITag + 
					  trSuffix;
		$('.cart-icon').find('tbody').append(listContent);
	}
	
}


function listSearchKeyUpEvent() {
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'searchList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		data : {"searchWord" : $('#listSearch').val()},
		dataType : 'json',
		success : function(resultData){
			var list = new Array();
			list = resultData.searchResult;
			makeSearhResultBox(list); // 검색 결과 컴포넌트를 구현
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	});
}
//검색 결과 컴포넌트를 구현하는 함수
function makeSearhResultBox(list){
	$('#searchList').empty(); //resultBox?를 초기화하고 새로 구성
	var listPrefix = '<li class="list-group-item">';
	var listSuffix = '</li>';
	var spanPrefix = '<span>';
	var spanSuffix = '</span>';
	var divPrefix = '<div>';
	var divSuffix = '</div>';
	//순서대로 5개까지만 가져옴
	for(var i=0; i<5; i++){
		var bookLinkPrefix = '<a href="/BookStore/productView.do?bookId='+ list[i].bookId+'">';
		var bookLinkSuffix = '</a>';		
		var listContent = listPrefix + 
							divPrefix + "도서명 : " + bookLinkPrefix + list[i].bookName + bookLinkSuffix + divSuffix +
							divPrefix + "저자명 : " + list[i].writerName + divSuffix +
							divPrefix + "가격 : " + list[i].bookSaleprice + "원" + divSuffix +
							divPrefix + "평점 : " + list[i].bookScoreDivideByCount + divSuffix +
						  listSuffix;
		
		$('#searchList').append(listContent);
	}
}