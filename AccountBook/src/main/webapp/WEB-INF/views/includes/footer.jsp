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
</body>    
</html>