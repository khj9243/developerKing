<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.member.model.vo.Member, com.kh.common.listener.SessionCheckListener" %>


<%
   //Member m = (Member)request.getAttribute("loginedMember");
   Member loginMember = (Member)session.getAttribute("loginedMember");
   
 //cookie값 받아오기
   Cookie[] cookies = request.getCookies();
   String saveId=null;
   String keeplogin=null;
   if(cookies != null){
      for(Cookie c : cookies){
         String key = c.getName();
         String value=c.getValue();
         if(key.equals("saveId")){
            saveId=value;
         }
         /* if(key.equals("keeplogin")){
        	 keeplogin = value;
         } */
      }
   }
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <!-- CSS -->
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lookPassword.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aside.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardWrite.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardView.css" type="text/css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<!-- JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel = "shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/favicon.ico"/>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	   
	<title>Study Together</title>
	
	<!-- <style>
		@import url('https://fonts.googleapis.com/css2?family=Sunflower&display=swap');
	</style> -->
	
</head>
<body>
	<div class=main>
<% if(loginMember==null){ %>
	    <a id=mainlogo href="<%=request.getContextPath() %>">
			<img src="<%=request.getContextPath() %>/images/logo.png" width="180px" height="100px">
		</a>
	    <button class="main2" type="button" onclick="location.href='<%=request.getContextPath() %>/faq/faqList'">고객센터</button>
		<button class="main2" type="button" data-target="#loginModalCenter" data-toggle="modal">회원가입</button>
	    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="main2">로그인</button>
	   <%}else{ %>
	   
	   <a id=mainlogo href="<%=request.getContextPath() %>">
			<img src="<%=request.getContextPath() %>/images/logo.png" width="180px" height="100px">
		</a>
		
      <button class="main2" type="button" onclick="location.href='<%=request.getContextPath() %>/faq/faqList'">고객센터</button>
      <%if(loginMember!=null && loginMember.getUserId().equals("admin")){ %>
		<button onclick="location.href='<%=request.getContextPath()%>/admin/adminPage'" class="main2">관리페이지</button>                                                                              
      <%} %>
		<button onclick="location.href='<%=request.getContextPath()%>/member/memberView'" class="main2">내정보보기</button>
		<button onclick="location.href='<%=request.getContextPath()%>/cart/cartView?id=<%=loginMember.getUserId() %>'" class="main2">장바구니</button>                                                                             
		<button onclick="logoutChk()" class="main2">로그아웃</button>
  		<%-- <div style="text-align:right;">
			<%=loginMember.getUserId() %> 님 환영합니다.
		</div> --%>
   <%} %>
  </div>
  
  <!-- 로그인 한지현 -->
<div id="id01" class="modal">
  <form class="modal-content animate" style="width:30%" action="<%=request.getContextPath()%>/login" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="loginClose" title="Close Modal">&times;</span>
      <img id="loginLogo" src="<%=request.getContextPath() %>/images/logo.png">
      <!-- <h1>로고</h1> -->
    </div>

    <div class="containerlogin">
      <!-- <label for="uname"><b>아이디</b></label> -->
      <input type="text" autocomplete="off" placeholder="ID" id="uname" name="uname" value = "<%=saveId!=null? saveId : "" %>" required>

      <!-- <label for="psw"><b>비밀번호</b></label> -->
      <input type="password" placeholder="Password" id="psw" name="psw" required>
        
      <button onclick="loginCheck();" class="login-button" type="submit">Login</button>

      <label>
        <input type="checkbox" id="store" name="saveId" <%=saveId!=null ? "checked" : "" %>>아이디 저장
      </label>
      
     <!--  <label>
      <input type="checkbox" id="keeplogin" name="keeplogin"> 로그인 유지
   	  </label> -->
    </div>
    
   
    <div class="containerlogin" style="background-color:#f1f1f1">
 	<a id="myBtn">비밀번호 찾기</a> &nbsp;
     
    </div>
  </form>
</div>
  <!-- 로그인 끝 --> 
  
     <!-- lookPw Modal -->
<div id="myModal" class="modal modal2">
	<div class="modal-content2">
		<form action="<%=request.getContextPath()%>/lookforpassword" method="post">
			<h4 id="hID">비밀번호 찾기</h2>
			<input type="text" autocomplete="off" name="id" id="userId" placeholder="ID"><br>
			<input type="text" autocomplete="off" name="name" id="name" placeholder="이름"><br>
			<input type="email" autocomplete="off" name="email" id="email" placeholder="EMAIL">
			<input class="form-button" id="pwbtn" type="submit" value="전송">
		</form>
	</div>
</div> 


<!-- Join Modal -->
<div class="modal fade" id="loginModalCenter" tabindex="-1" role="dialog" aria-labelledby="loginModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <h2 class="text-center">회원가입</h2>       
                <div class="join-form">
                    <form action="<%=request.getContextPath() %>/member/memberEnrollEnd" method="post" onsubmit='return validate();'>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <div class="form-group">
                                        <input type="text" id="id" autocomplete="off" class="form-control" name="id" placeholder="ID" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-idSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        아이디가 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-idDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        영문 대.소문자, 숫자 _,- 6글자 이상만 입력 가능합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-idDuplicated">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        중복된 아이디입니다.
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="password" id="password1" class="form-control" name="jPsw" placeholder="Password" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-pwSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        비밀번호가 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-pwDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        영문 대,소문자, 숫자, 특수문자를 8글자 이상 입력하세요
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="password" id="password2" class="form-control" placeholder="Password Check" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-pwSameSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        비밀번호가 일치합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-pwSameDanger">                                        
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        비밀번호가 서로 일치하지 않습니다
                                    </div>
                                </tr>
                                <tr>    
                                    <div class="form-group">
                                        <input type="text" autocomplete="off" id="joinName" class="form-control" name="userName" placeholder="Username" required>
                                    </div>                
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-nameSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        이름이 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-nameDanger">                                        
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        2~6글자의 한글만 2글자 이상 입력하세요
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="email" autocomplete="off" id="joinEmail" class="form-control" name="email" placeholder="Email" required>
                                    </div>        
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-emailSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        이메일이 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-emailDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        이메일 형식에 맞게 작성하세요 예)aa01@aa.aa
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group" id="submit">
                                    	<input type="submit" class="btn btn-warning btn-block" value="가입하기">
                                    </div>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	//로그인 깃발
	var joinFlag=false;
	var joinIdFlag=false;
	var joinPwStateFlag=false;
	var joinPwSameFlag=false;
	var joinNameFlag=false;
	var joinEmailFlag=false;
	
	//경고창 숨기기
	$("#alert-idSuccess").hide();
	$("#alert-idDanger").hide();
	$("#alert-idDuplicated").hide();
	$("#alert-pwSuccess").hide();
	$("#alert-pwDanger").hide();
	$("#alert-pwSameSuccess").hide();
	$("#alert-pwSameDanger").hide();
	$("#alert-nameSuccess").hide();
	$("#alert-nameDanger").hide();
	$("#alert-emailSuccess").hide();
	$("#alert-emailDanger").hide();
	
	//아이디 유효값 체크
	$("#id").blur(function(){
	    // userIdCheck : 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 
	    // {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크한다.
		//ajax통신으로 id중복체크
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		console.log(ctx+'/member/idDuplicateCheck');
		//console.log($(this).val().trim());
		var str="";
		
		var idVal=$(this).val().trim();
		console.log(idVal);
		
		$.ajax({
			url:ctx+'/member/idDuplicateCheck',
			dataType:"json",
			type:"post",
			data:{"id":idVal},
			//async: false, //결과값 받아서 if분기문에 사용해야하므로 동기로 전환
			success:function(data) {
				console.log(data.result);
				str=data.result;
				
				var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
		        if(!(idVal=="")){        	
		        	console.log(str);
		        	//db에 아이디가 있지 않고, 유효성검증 통과
		        	if(str=="NO"){
		                 $("#alert-idSuccess").hide();
		                 $("#alert-idDanger").hide();
		                 $("#alert-idDuplicated").show();
		                 joinIdFlag=false;
		            } else if(!userIdCheck.test(idVal)){  
		                $("#alert-idSuccess").hide();
		                $("#alert-idDanger").show();
		                $("#alert-idDuplicated").hide();
		                joinIdFlag=false;
		            }else {
		            	$("#alert-idSuccess").show();
		            	$("#alert-idDanger").hide();
		            	$("#alert-idDuplicated").hide();
		            	joinIdFlag=true;
		            } 
		        }else{
		            $("#alert-idSuccess").hide();
		            $("#alert-idDanger").hide();
		            $("#alert-idDuplicated").hide();
		            joinIdFlag=false;
		        }
			}
		});
		
	    
	});
	
	//비밀번호 유효값 체크
	$("#password1").blur(function(){
	    // passwdCheck : 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 한다.
	    var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	    if(!$(this).val().trim()==""){            
	        if(!passwdCheck.test($(this).val().trim())){
	            $("#alert-pwSuccess").hide();
	            $("#alert-pwDanger").show();
	            joinPwStateFlag=false;
	        }
	        if(passwdCheck.test($(this).val().trim())){
	            $("#alert-pwSuccess").show();
	            $("#alert-pwDanger").hide();
	            joinPwStateFlag=true;
	        } 
	    } else{
	        $("#alert-pwSuccess").hide();
	        $("#alert-pwDanger").hide();
	        joinPwStateFlag=false;
	    }
	});
	
	//비밀번호 일치 로직
	//입력값 들어왔을 때 비밀번호 동일한지 체크
	$("#password2").blur(function(){ 
	    var password1=$("#password1").val().trim();
	    var password2=$("#password2").val().trim();
	    if(password1 != "" || password2 != ""){ 
	        if(!(password1 == password2)){ 
	            $("#alert-pwSameSuccess").hide();
	            $("#alert-pwSameDanger").show();
	            joinPwSameFlag=false;
	        }else { 
	            $("#alert-pwSameSuccess").show();
	            $("#alert-pwSameDanger").hide();
	            joinPwSameFlag=true;
	        }
	    }  else {
	        $("#alert-pwSameSuccess").hide();
	        $("#alert-pwSameDanger").hide();
	        joinPwSameFlag=false;
	    }
	});
	
	//이름 유효값 체크
	$("#joinName").blur(function(){
	    // nameCheck : 2~6글자의 한글만 입력하였는지 검사
	    var nameCheck = RegExp(/^[가-힣]{2,6}$/);
	    if(!$(this).val().trim()==""){            
	        if(!nameCheck.test($(this).val().trim())){
	            $("#alert-nameSuccess").hide();
	            $("#alert-nameDanger").show();
	            joinNameFlag=false;
	        }else if(nameCheck.test($(this).val().trim())){
	            $("#alert-nameSuccess").show();
	            $("#alert-nameDanger").hide();
	            joinNameFlag=true;
	        } 
	    }else{
	        $("#alert-nameSuccess").hide();
	        $("#alert-nameDanger").hide();
	        joinNameFlag=false;
	    }
	});
	//이메일 유효값 체크
	$("#joinEmail").blur(function(){
	    // emailCheck : 이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa
	    var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    if(!$(this).val().trim()==""){            
	        if(!emailCheck.test($(this).val().trim())){
	            $("#alert-emailSuccess").hide();
	            $("#alert-emailDanger").show();
	            joinEmailFlag=false;
	        }else if(emailCheck.test($(this).val().trim())){
	            $("#alert-emailSuccess").show();
	            $("#alert-emailDanger").hide();
	            joinEmailFlag=true;
	        }             
	    }else{            
	        $("#alert-emailSuccess").hide();
	        $("#alert-emailDanger").hide();
	        joinEmailFlag=false;
	    }
	});
	            
	// nickNameCheck : 한글과 영어, 숫자만 사용하였는지 검사
	// var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	// birthdayCheck : 생년월일을 형식에 맞게 썻는지 검사 19또는 20으로 시작하여 0~9까지의 수개 2개까지 하여 년도 그 뒤에 0이면1~9 1이면 1~2(1월부터 12월까지기 때문에) 이런식으로 검사를 해준다.
	// var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
	// phonNumberCheck : 01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사한다. 
	// var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	//회원가입 폼 전송 제어
	function validate(){
		if(!joinIdFlag){
			joinFlag=false;
			$("#submit").attr("disabled", "disabled");
			alert("아이디가 적합하지 않습니다");
			return false;
		}
		if(!joinPwStateFlag){
			joinFlag=false;
			$("#submit").attr("disabled", "disabled");
			alert("비밀번호가 적합하지 않습니다");
			return false;
		}
		if(!joinPwSameFlag){
			joinFlag=false;
			$("#submit").attr("disabled", "disabled");
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if(!joinNameFlag){
			joinFlag=false;
			$("#submit").attr("disabled", "disabled");
			alert("이름이 적합하지 않습니다");
			return false;
		}
		if(!joinEmailFlag){
			joinFlag=false;
			$("#submit").attr("disabled", "disabled");
			alert("이메일이 적합하지 않습니다");
			return false;
		}
		var check=joinFlag;
		if(check) {
			$("#submit").removeAttr("disabled");
			alert();
			return false;
		}
	}
	
</script>
<!-- Join Modal End-->

<!-- Navigation Bar -->
<div id='submenu'>
  <ul class='mymenu'>
    <li class='menu1'>
      <a href="<%=request.getContextPath()%>/lector/lectorList">강좌 스터디</a>
    </li>
    <li class='menu2'>
      <a href="<%=request.getContextPath()%>/study/studyList">일반 스터디</a>
    </li>
    <li class='menu3'>
    	<%if(loginMember!=null) {%>
    		 <a href="<%=request.getContextPath()%>/review/reviewLecture/reviewLectureList">스터디 후기</a>
    	<%}else{ %>
    	  	<a href="<%=request.getContextPath()%>" onclick="loginErrorMsg();">스터디 후기</a>
     	<%} %>
      		<ul  class='menu4-submenu'>
			<li>
				<%if(loginMember!=null) {%>
					<a href="<%=request.getContextPath()%>/review/reviewLecture/reviewLectureList">강좌 스터디</a>
				<%}else{ %>
					<a href="<%=request.getContextPath()%>" onclick="loginErrorMsg();">강좌 스터디</a>
				<%} %>
			</li>
			<li>
				<%if(loginMember!=null) {%>
        			<a href="<%=request.getContextPath()%>/review/reviewStudy/reviewStudyList">일반 스터디</a>
         		 <%}else{ %>
           			<a href="<%=request.getContextPath()%>" onclick="loginErrorMsg();">일반 스터디</a>
   				  <%} %>
      	   </li>
     
        </ul>
    </li>
    <li class='menu4'>
      <a href="<%=request.getContextPath()%>/board/boardList">커뮤니티</a>
       <%--  <ul  class='menu4-submenu'>
          <li>
            <a href="<%=request.getContextPath()%>/board/boardList?category=qna">묻고 답하기</a>
          </li>
        </ul> --%>
    </li>
  </ul>
</div>
<!-- Navigation Bar End -->

<script>
   $( document ).ready( function() {
     var jbOffset = $( '.mymenu' ).offset();
     $( window ).scroll( function() {
       if ( $( document ).scrollTop() > jbOffset.top ) {
         $( '.mymenu' ).addClass( 'jbFixed' );
       }
       else {
         $( '.mymenu' ).removeClass( 'jbFixed' );
       }
     });
   });
   //캐러셀
   $(document).ready(function(){
       // Activate Carousel
      // $("#myCarousel1").carousel();
       // Enable Carousel Indicators
       $(".item1").click(function(){
         $("#myCarousel").carousel(0);
       });
       $(".item2").click(function(){
         $("#myCarousel").carousel(1);
       });
       $(".item3").click(function(){
         $("#myCarousel").carousel(2);
       });  
       // Enable Carousel Controls
       $(".left").click(function(){
         $("#myCarousel").carousel("prev");
       });
       $(".right").click(function(){
         $("#myCarousel").carousel("next");
       });
     });
   
	//비밀번호 찾기
   // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
		var btn = document.getElementById("myBtn");


// When the user clicks on the button, open the modal 
   btn.onclick = function() {
        modal.style.display = "block";
   }
   window.onclick = function(event) {
       if (event.target == modal) {
           modal.style.display = "none";
       }
   }
   function loginErrorMsg(){
	   alert("로그인 후 이용해 주세요!");
   }
 
   function logoutChk(){
	   if (confirm("로그아웃 하시겠습니까??") == true){    //확인
		   location.replace('<%=request.getContextPath()%>/logout.do');
       }else{   //취소
          return false;
       }
   }
   
</script>