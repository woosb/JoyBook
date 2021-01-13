<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- FOOTER -->
<footer class="container">
  <p class="float-right"><a href="#">Back to top</a></p>
  <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
<script>
   $(function(){
       $(".menu").removeClass("active");
       if('${pageName}' != ''){
        $("#"+'${pageName}').addClass('active');
       }
   });
   var pageSubmitFn = function(menu){
       if(menu === "home"){
           location.href="/"
       }else if(menu ==="CustomerList"){
           location.href="/customer/list"
       }else if(menu ==="Dashboard"){
           location.href="/board/dashboard"
       }else if(menu ==="boardList"){
           location.href="/board/list"
       }else if(menu ==="SIGNIN"){
           location.href="/member/signIn"
       }else if(menu ==="SIGNOUT"){
           location.href="/member/signOut"
       }
   }
</script>  
<script>
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		if( gap < (1000*60*60*24) ){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '':'0') + mi, ':', (ss > 9 ? '':'0') + ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [yy, '/', (mm>9?'':'0') + mm, '/',(dd > 9?'':'0') + dd].join('');
		}
	}
</script>
</body>    
</html>