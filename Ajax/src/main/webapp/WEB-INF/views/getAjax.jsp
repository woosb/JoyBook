<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="getajax();">클릭</button>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
function getajax(){
	
	//$.ajax("주소").done();
	$.ajax({
		type:"GET",
		url:"/ajax?username=asd&password=1234",
// 		data:"", =>get은 전송할 http의 body가 없음
//		contentType: 전송할 data가 없으니까 그 data를 설명할 필드가 없다.
		dataType: "text" // 응답받을 데이터의 타입(파싱해준다.)
	})
	.done(function(result){
		alert(result);
	}) //ajax 통신완료후에 정상이면 done이 가지고 있는 함수 호출
	.fail(function(error){
		
	}); //ajax 통신완료후에 비정상이면 fail이 가지고 있는 함수 호출	
}
</script>
</html>