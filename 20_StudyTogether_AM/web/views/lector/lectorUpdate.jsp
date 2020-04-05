<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.lector.model.vo.Lector" %>

<%
	Lector l=(Lector)request.getAttribute("lector");

%>

<%@ include file="/views/common/header.jsp"%>
<style>

fieldset {
    box-sizing: border-box;
    font-family: Sunflower;
    width: 700px;
    height: 300px;
    margin: 0 auto;
}
button{
    /* background-color: #4CAF50; */
    color: black;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

</style>


     <h2>강좌 수정</h2><br>
   <form id="regFrm" action="<%=request.getContextPath()%>/lector/lectorUpdateEnd" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="pNo" value="<%=l.getLectorNo() %>" />
     강사명<input type="text" name="lectorWriter" value="<%=l.getLectorWriter()%>" readonly><br>
		<input type="hidden" name="lectorDate" value="<%=l.getLectorDate() %>" ><br>
        강좌 이름 <input type="text" name="lectorTitle" value="<%=l.getLectorTitle()%>"><br><br>
        강좌 분야
      <select id="searchType" name="searchType" > 
     	<option value="카테고리">카테고리</option>
     	 <optgroup label="어학,회화">
          <option value="영어" <%=l!=null&&l.getLectorCategory().equals("영어")?"selected":"" %>>영어</option>
          <option value="일본어" <%=l!=null&&l.getLectorCategory().equals("일본어")?"selected":"" %>>일본어</option>
          <option value="스페인어" <%=l!=null&&l.getLectorCategory().equals("스페인어")?"selected":"" %>>스페인어</option>
          <option value="불어" <%=l!=null&&l.getLectorCategory().equals("불어")?"selected":"" %>>불어</option>
      	</optgroup>
      	<optgroup label="자격증">
          <option value="제빵" <%=l!=null&&l.getLectorCategory().equals("제빵")?"selected":"" %>>제빵</option>
          <option value="정보처리기사" <%=l!=null&&l.getLectorCategory().equals("정보처리기사")?"selected":"" %>>정보처리기사</option>
          <option value="컴퓨터활용" <%=l!=null&&l.getLectorCategory().equals("컴퓨터활용")?"selected":"" %>>컴퓨터활용</option>
          <option value="토익" <%=l!=null&&l.getLectorCategory().equals("토익")?"selected":"" %>>토익</option>
      	</optgroup>
      	<optgroup label="IT">
          <option value="알고리즘" <%=l!=null&&l.getLectorCategory().equals("알고리즘")?"selected":"" %> >알고리즘</option>
          <option value="데이터베이스" <%=l!=null&&l.getLectorCategory().equals("데이터베이스")?"selected":"" %>>데이터베이스</option>
          <option value="자바프로그래밍" <%=l!=null&&l.getLectorCategory().equals("자바프로그래밍")?"selected":"" %>>자바프로그래밍</option>
      	</optgroup>
      </select>
       <br>
      <script>
     document.regFrm.searchType.value="<%=l.getLectorCategory()%>"
      
      </script>
            <br>
            상세 소개<br>
            <textarea name="intro" cols="100" rows="20" style="resize: none;"  placeholder=""><%=l.getLectorDetail()%></textarea><br>
            <br>
  	썸네일 이미지<br>
            <input type="file" name="lectorImg" />
            <%if(l.getLectorOriginalImg()!=null){ %>
            <span id="fname"><%=l.getLectorOriginalImg() %></span>
             <input type="hidden" name="lectorImg1" value="<%=l.getLectorOriginalImg()%>">
           <%} %>
            <br><br>
           <!-- 강좌 비디오 첨부 -->
             <%if(l.getLectorOriginalVideo()!=null){ %>
            <input type="hidden" name="lectorVideo" value="<%=l.getLectorOriginalVideo() %>" readonly/><br><br> -->
			<%} %>
            가격<br>
            <input type="number" name="price" value="<%=l.getLectorPrice() %>">원<br><br>
                
                <input type="submit" value="등록">
                <input type="reset" value="취소">
       </form>
       <script>
    	$(function(){
    		$("input[name='lectorImg']").change(function(){
    			if($(this).val()==""){
    				$("#fname").show();
    			}else{
    				$("#fname").hide();
    			}
    		})
    	})    
  </script>

<%@ include file="/views/common/footer.jsp"%>
