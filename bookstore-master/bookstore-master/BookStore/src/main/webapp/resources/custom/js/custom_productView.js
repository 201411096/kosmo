/*
함수
	ㄴ reviewBtnHandler : 리뷰 작성 버튼을 눌렀을 떄
	ㄴ updateBtnHandler : 리뷰 작성 옆에 있는 수정 버튼을 눌렀을 떄
	ㄴ deleteHandler : 리뷰 삭제 버튼을 눌렀을 떄
	ㄴ getContentBtnHandler : 리뷰 삭제 옆에 있는 수정 버튼을 눌렀을 때
		ㄴ 해당 리뷰의 정보를 리뷰 입력창으로 끌어옴
	ㄴ makeReviewList : 리뷰부분을 전부 지우고 다시 구성해주는 함수
*/
$(function(){
	$('#review-btn').on('click', reviewBtnHandler);
	$('#update-btn').on('click', updateBtnHandler);
	$(document).on('click', '#r-modify', getContentBtnHandler);
	$(document).on('click', '#r-delete', deleteHandler);
});

function reviewBtnHandler(){
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'insertReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		data : {
			"bookId" : $('#bookIdInReviewForm').val(),
			"buyreviewScore" : $('#buyreviewScore').val(),
			"buyreviewContent" : $('#buyreviewContent').val()			
			},
		dataType : 'json',
		success : function(resultData){
			$('#buyreviewScore').val("");
			$('#buyreviewContent').val("");
			if(resultData.insertResult === "1"){
				makeReviewList(resultData);
			}else if(resultData.insertResult === "0"){
				alert("한명의 사용자는 하나의 책에 여러개의 리뷰를 등록할 수 없습니다.");
			}
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   alert("로그인이 필요합니다.");
	   },
	   complete :function(resultData){   
	   }
		
	});
}

function updateBtnHandler(){
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'updateReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		data : {
			"bookId" : $('#bookIdInReviewForm').val(),
			"buyreviewScore" : $('#buyreviewScore').val(),
			"buyreviewContent" : $('#buyreviewContent').val()			
			},
		dataType : 'json',
		success : function(resultData){
			$('#buyreviewScore').val("");
			$('#buyreviewContent').val("");
			if(resultData.updateResult === "1"){
				makeReviewList(resultData);
			}else if(resultData.updateResult === "0"){
				alert("리뷰 수정 실패");
			}
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   alert("로그인이 필요합니다.");
	   },
	   complete :function(resultData){   
	   }
	});
}
function deleteHandler(){
	console.log('삭제 버튼 연결 확인');
	var customerId = $(this).parent().find('.reviewcustomerId').val().trim();
	var eventObject = $(this);
	var reviewId = eventObject.parent().find('.buyreviewId').val().trim();
	$.ajax({
		type:'post', 
		async:true, 
		url: 'deleteReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
		data : {"reviewId" : reviewId,
				"customerId" : customerId
				},
		dataType : 'json',
		success : function(resultData){
			//reviewId와 loginId가 같을 경우만 삭제하고 아닐 경우에는 경고창
			if(resultData.deleteResult==="1"){
				makeReviewList(resultData);
				console.log('삭제 성공');
			}else{
				console.log('삭제 실패');
				alert("자신이 작성한 리뷰만 삭제할 수 있습니다.");
			}
			
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   alert("로그인이 필요합니다.");
	   }		
	});
}

function makeReviewList(resultData){
	var divCommentOptionPrefix = '<div class="comment-option">';
	var divCoItemPrefix = '<div class="co-item">';
	var divSuffix = '</div>';
	var divAvatarPicPrefix = '<div class="avatar-pic">';
	var imgPrefix = '<img src="resources/img/product-single/';
	var imgSuffix = '" alt="">';
	var divAvatarTextPrefix = '<div class="avatar-text">';
	var h5Prefix = '<h5>';
	var h5Suffix = '</h5>';
	var spanPrefix = '<span>';
	var spanSuffix = '</span>';
	var divAtReplyPrefix = '<div class="at-reply">';
	var modifyButton ='<input type="button" id="r-modify" class="site-btn" value="수정">';
	var inputTypeHiddenreviewcustomerIdPrefix = '<input type="hidden" class="reviewcustomerId" value="';
	var inputTypeHiddenreviewcustomerIdSuffix = ' ">';
	var inputTypeHiddenreviewIdPrefix = '<input type="hidden" class="buyreviewId" value="';
	var inputTypeHiddenreviewIdSuffix = ' ">';
	var inputTypeDeleteButton = '<input type="button" id="r-delete" class="site-btn" value="삭제">';
	$('#review-container').empty();
	for(var i=0; i<resultData.reviewListSize; i++){
		var listContent= 
			divCoItemPrefix +
			divAvatarPicPrefix + imgPrefix + 'avatar-1.png' + imgSuffix + divSuffix +
			divAvatarTextPrefix +
			h5Prefix + 
			resultData.reviewList[i].customerId +
			spanPrefix + resultData.reviewList[i].buyreviewScore + spanSuffix + 
			h5Suffix +
			divAtReplyPrefix + resultData.reviewList[i].buyreviewContent + divSuffix +
			inputTypeHiddenreviewcustomerIdPrefix + resultData.reviewList[i].customerId + inputTypeHiddenreviewcustomerIdSuffix +
			inputTypeHiddenreviewIdPrefix + resultData.reviewList[i].buyreviewId + inputTypeHiddenreviewIdSuffix +
			modifyButton +
			'&nbsp' +
			inputTypeDeleteButton +
			divSuffix +
			divSuffix;
		
		$('#review-container').append(listContent);
	}
}

function getContentBtnHandler(){
	var customerId = $(this).parent().find('.reviewcustomerId').val().trim();
	var eventObject = $(this);
	var reviewId = eventObject.parent().find('.buyreviewId').val().trim();
	$.ajax({
		type:'post', 
		async:true, 
		url: 'getLoginCustomerIdAndReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
		data : {"reviewId" : reviewId},
		dataType : 'json',
		success : function(resultData){
			if(resultData.customerId!=null)
				var loginCustomerId = resultData.customerId.trim();
			//reviewId와 loginId가 같을 경우 자신이 작성한 리뷰의 정보를 가져와서 세팅해줌
			if(customerId==loginCustomerId){
				$('#buyreviewContent').text( resultData.reviewVO.buyreviewContent );
				$('#buyreviewScore').val( resultData.reviewVO.buyreviewScore );
			}else if(loginCustomerId==null){
				alert("로그인이 필요합니다.")
			}else if(customerId!=loginCustomerId){
				alert("본인이 작성한 리뷰만 수정할 수 있습니다.");
			}
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }		
	});
}