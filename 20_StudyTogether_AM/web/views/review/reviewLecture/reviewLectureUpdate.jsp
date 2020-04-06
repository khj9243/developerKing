<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.kh.review.model.vo.ReviewLecture" %>
<%
	ReviewLecture revL = (ReviewLecture)request.getAttribute("reviewLecture");
%>
<style>
#revWTitle{
	text-align:center;
	height:50px;
	border:1px solid #ccc;
}
table.revWrite{
        border-collapse: separate;
        border-spacing: 1px;
        text-align: left;
        line-height: 2;
        border-top: 1px solid #ccc;
        margin : 0 auto;
        width:500px;
        cellpadding:"2";
}
table.revWrite tr {
        width: 100px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
}
table.revWrite td {
         font-size: 15px;
         width: 100px;
         padding: 10px;
         vertical-align: top;
         border-bottom: 1px solid #ccc;
}
#revUpdate,#revWCancelBtn{
	 color: black;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block; 
    margin-: 0px auto; 
    width: 10%;
    align: center;
}
</style>
<form action="<%=request.getContextPath() %>/review/reviewLectureUpdateEnd">
<br>
<h2 style="text-align:center"><%=revL.getLectureName() %><input type="hidden" name="allLecture" value="<%=revL.getLectureName()%>" readonly required></h2>
<br>
<input type="hidden" name="no" value=<%=revL.getReviewLecNo() %>>
   <table class="revWrite">
      <tr>
        <td style="text-align: center;">작성자</td>
        <td><%=revL.getReviewLecWriter() %><input type="hidden" name="writer" value="<%=loginMember.getUserId()%>" readonly required/></td>
       </tr>
       
        <tr>
          <td style="text-align: center;">분야</td>
          <td><select name="field" > 
            <option value="<%=revL.getReviewLecCategory() %>"><%=revL.getReviewLecCategory() %></option>
            <optgroup label="어학,회화">
                <option value="불어">불어</option>
                <option value="스페인어">스페인어</option>
                <option value="영어">영어</option>
                <option value="일본어">일본어</option>
                <option value="중국어">중국어</option>
                <option value="어학 기타">어학 기타</option>
            </optgroup>
            
            <optgroup label="자격증">
                <option value="공인중개사">제빵</option>
                <option value="미용">미용</option>
                <option value="정보처리기사">정보처리기사</option>
                <option value="컴퓨터활용">컴퓨터활용</option>
                <option value="토익">토익</option>
                <option value="자격증 기타">자격증 기타</option>
            </optgroup>

            <optgroup label="취미">
                <option value="공예">공예</option>
                <option value="맛집탐방">맛집탐방</option>
                <option value="밴드">밴드</option>
                <option value="요리">요리</option>
                <option value="운동">운동</option>
                <option value="취미 기타">취미 기타</option>
            </optgroup>
    

            <optgroup label="IT">
                <option value="알고리즘">알고리즘</option>
                <option value="데이터베이스">데이터베이스</option>
                <option value="자바프로그래밍">자바프로그래밍</option>
                <option value="운영체제">운영체제</option>
                <option value="HTML">HTML</option>
                <option value="IT 기타">IT 기타</option>
            </optgroup>

            <optgroup label="대학생">
                <option value="취업">취업</option>
                <option value="면접">면접</option>
                <option value="인문학과">인문학과</option>
                <option value="자연과학">자연과학</option>
                <option value="예체능">예체능</option>
                <option value="대학생 기타">대학생 기타</option>
            </optgroup>
            </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">만족도</td>
           <td><%=revL.getReviewLecStar()%><input type="hidden" name="star" value="<%=revL.getReviewLecStar()%>" readonly required></td>
        </tr>
        <tr>
           <td style="text-align: center;">내용</td>
           <td style="height:auto"><textarea name="content" cols=55 rows=10 style="resize:none;"><%=revL.getReviewLecContent() %></textarea></td>
        </tr>
          
   </table>
   <br>		
     <div style="text-align:center">
	    	 <button type="button" onclick ="cancelChk()" id="revWCancelBtn" >취소</button>
	    	  <button type="submit" id="revUpdate">수정 완료</button>
	</div>	
</form>
	  
 <script>
          function cancelChk(){
             if (confirm("정말 취소하시겠습니까??") == true){    //확인
                   location.replace("<%=request.getContextPath()%>/review/reviewStudyView?no=<%=revL.getReviewLecNo()%>");
               }else{   //취소
                  return false;
               }
           }
          
      </script>
<script>
</script>
<%@ include file="/views/common/footer.jsp"%>