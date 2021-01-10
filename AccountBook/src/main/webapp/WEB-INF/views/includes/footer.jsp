<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</main>
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="#">Back to top</a></p>
    <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/resources/bootstrap/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/resources/bootstrap/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>      
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
</html>