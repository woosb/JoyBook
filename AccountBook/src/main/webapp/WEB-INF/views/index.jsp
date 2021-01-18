<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header.jsp" %>
<main role="main">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>j._.oy_kerker</h1>
            <p>
                       이철헤어커커 Joy<br>
			🌼#이철헤어커커건대스타시티점조이<br>
			🌼#건대미용실 #발레아쥬 #옴브레 #에어터치 #디자인컬러 #탈색 #백금발<br>
			ఇ En’joy’ ఇ<br>
			빛나는 당신을 위한 ‘색’다른 디자인<br>
			펌 계정_ @j._.oy_perm<br>
			〰️카카오헤어샵 & 네이버예약 20%〰️<br>
			👇👇예약 링크 👇👇<br>
			hairshop.kakao.com/shops/45/stylers/53255<br>
			</p>
            <p><a class="btn btn-lg btn-primary" href="/member/signIn" role="button">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row" id="mainContents">
      
    </div><!-- /.row -->
  </div><!-- /.container -->
  <hr>
</main>
<%@ include file="includes/commonscript.jsp" %>
<script>
getIndexArticle();
function getIndexArticle(){
	$.ajax({
		url:"/board/getIndexArticle",
		type:"GET",
		dataType:"JSON",	
	}).done(function(result){
		var content = document.getElementById("mainContents");
		str = "";
		for(var i = 0; i < result.length; i++){
			str += '<div class="col-lg-4">';
			if(result[i].thumbnail == ""){
				str += '<img src="/download/default/default.png" class="bd-placeholder-img rounded-circle" width="140" height="140"/>';
			}else{
				str += '<img src="'+ result[i].thumbnail+'" class="bd-placeholder-img rounded-circle" width="140" height="140"/>';
			}
			str += '<h2>'+ result[i].title +'</h2>';
			str += '<p>'+ result[i].cardText +'</p>';
			str += '<p><a class="btn btn-secondary" href="/board/detail/'+result[i].id+'" role="button">View details &raquo;</a></p>';
			str += '</div>';
		}		
		content.innerHTML = str;
		console.log(result);
	});
}
</script>
<%@ include file="includes/footer.jsp" %>

