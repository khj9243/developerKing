<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/member/myPageHeader.jsp" %>


<div class="row">
	<h4>내가 개설한 스터디</h4>
</div>
<div class="row">
	<h4><%=loginMember.getUserId()%>님께서는 아직 개설한 스터디가 없습니다</h4>
</div>
<div class="row">
	<a href="<%=request.getContextPath() %>/study/studyList">
		<p>새 스터디 만들러 가기!</p>
	</a>
</div>

<p>개설한 스터디가 있다면...</p>
<div class="row">
  <form action="" class="form-group col" name="frm1">
    <table class="table">
          <thead class="text-center">
            <tr>
              <th>등록 번호</th>
              <th>스터디명</th>
              <th>등록일</th>
              <th>현재 참여자 수</th>
            </tr>
          </thead>
          <tbody class="text-center">
            <tr>
                <td class="">1</td>
                <td class="">JavaScript 강의</td>
                <td class="">
                  <div class="form-check-inline">
                     2020-02-22
                  </div>                        
                </td>
                <td>현재 0명</td>
            </tr>      
          </tbody>
      </table>
    </form>
</div>


<div class="row">
    <h4>내가 참여한 스터디</h4>
</div>
<div class="row">
	<h6><%=loginMember.getUserId()%>님께서는 아직 참여한 스터디가 없습니다</h6>
</div>
<div class="row">
	<a href="<%=request.getContextPath() %>/study/studyList">
		<p>새 스터디 보러가기!</p>
	</a>
</div>
<p>개설한 스터디가 있다면...</p>
<div class="row">
  <form action="" class="form-group col" name="frm1">
    <a href="<%=request.getContextPath() %>/lector/lectorList">
	</a>
    <table class="table">
          <thead class="text-center">
            <tr>
              <th>등록 번호</th>
              <th>스터디장</th>
              <th>스터디명</th>
              <th>등록일</th>
              <th>현재 참여자 수</th>
            </tr>
          </thead>
          <tbody class="text-center">
            <tr>
                <td class="">1</td>
                <td class="">이름을 입력하세요</td>
                <td class="">굳스터디</td>
                <td class="">
                  <div class="form-check-inline">
                     2020-02-22
                  </div>                        
                </td>
                <td>현재 0명</td>
            </tr>      
          </tbody>
      </table>
    </form>
</div>



<%@ include file="/views/member/myPageFooter.jsp" %>