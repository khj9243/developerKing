<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="java.util.List,com.kh.study.model.vo.Study,java.util.Date,java.text.SimpleDateFormat" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/studyView.css" type="text/css"/>

<%
	Study s=(Study)request.getAttribute("study");
%>
<section>
	<div class="container" >
    	<a href="<%=request.getContextPath()%>/study/studyUpdate?no=<%=s.getStudyNo() %>" class="btn btn-info" role="button">수정</a>
    	<a href="<%=request.getContextPath() %>/study/studyDelete?no=<%=s.getStudyNo() %>" class="btn btn-info" role="button">삭제</a>
	</div>

  <!-- <div id="intro">
 </div> -->
  <div style="margin-top:100px;margin-bottom:150px;" class="watch">
      <p id="watchtitle"><h2><%=s.getStudyName() %></h2></p>
      <p id="detail">희망 일자 : <%=s.getStudyPossibleDay() %>  </p>
        스터디 지역 : <%=s.getStudyArea() %></br>
        	<p id="detail2">모집 인원 : <%=s.getMaxMember() %>명 /
         	참가 인원 :0명</br></p><!--(nowmember추가  -->
          <input type="hidden" name="nowMember" value="">      <p id="endDate"> 모집 기간 : <%=s.getEndDate() %> 까지</p>
          <input type="hidden" name="student" value="">
    <div class="video-inform">
      <%=s.getStudyDetail() %>
    </div>
    <button type="button" class="basket" onclick="apply();">참여하기</button>
  </div>
</section>
<style>
	#detail2{
		font-size:15px;
	
	}


</style>
  <script>
//study참가하기 버튼을 누르면 현재인원이 카운트 된다.
    function apply(){
    var result= confirm("스터디에 참여하시겠습니까?");
     if(result==true){
       //새로운 스터디입장시
       alert("스터디에 참가되었습니다.");
       location.href="<%=request.getContextPath()%>/study/studyJoin";
       //인원수 카운트하기
     }
   /*   else if{//else if(로그인이 되어있지만 ,studyJoin!=null 이미 가입된 스터디입니다.
       alert("이미 가입된 스터디 입니다..");
     } */else{
    	 alert("로그인 후 이용 가능합니다.")
     }
    }
  </script>
 
<%@ include file="/views/common/footer.jsp"%>
