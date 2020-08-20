//사용하지 않는 js파일 => admin_writer_pagination.js 파일로 대체됨
//같은이유로 admin_writer.jsp 파일도 사용하지 않음
$(function(){
	getWriterData();
	$('#listSearch').on('keyup', getWriterData);
	$(document).on("click",".btn-primary", updateBtnEvent);
	$(document).on("click",".btn-warning", deleteBtnEvent);
});

function updateBtnEvent(){
	console.log( $(this).parent().prev().prev().text() );
	console.log( $(this).parent().prev().text() );
	$(this).next().submit();
}

function deleteBtnEvent(){
	console.log( $(this).parent().prev().prev().prev().text() );
	console.log( $(this).parent().prev().prev().text() );
	$(this).next().submit();
}

function getWriterData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getWriterData.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val()},
		dataType : 'json',
		success : function(resultData){
			drawWriterTable(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function drawWriterTable(data){
	$('#writerTable').empty();
	var formPrefix1 = '<form action="/BookStore/admin/loadWriterUpdatePage.do">';
	var formPrefix2 = '<form action="/BookStore/admin/writerDelete.do">';
	var formSuffix = '</form>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	var buttonUpdate = '<button class="btn btn-primary">수정</button>';
	var buttonDelete = '<button class="btn btn-warning">삭제</button>';
	var inputtypehiddenPrefix = '<input type="hidden" name="writerId" value="';
	var inputtypehiddenSuffix = '">';
	for(var i=0; i<data.writerListSize; i++){
		var listContent =  
						  trPrefix +
						  tdPrefix + data.writerList[i].writerId + tdSuffix +
						  tdPrefix + data.writerList[i].writerName + tdSuffix +
						  tdPrefix + buttonUpdate + 
						  formPrefix1 + inputtypehiddenPrefix + data.writerList[i].writerId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  tdPrefix + buttonDelete + 
						  formPrefix2 + inputtypehiddenPrefix + data.writerList[i].writerId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  trSuffix		  
						  ;
		$('#writerTable').append(listContent);
	}
}