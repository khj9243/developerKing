<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header페이지 불러오기 -->
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css" type="text/css"/>

<div class="container">
	<div class="row justify-content-center mt-5 mb-5">
	    <h2>관리자 메인 페이지</h2>
	</div>
	<div class="row mb-5" style="height:40px">
	    <div class="col text-center bg-light border-0 m-1 p-2" style=" cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/admin/adminGrantLector';">
	      <a href="<%=request.getContextPath()%>/admin/adminGrantLector" class="text-decoration-none text-reset text-decoration-none text-dark">강좌신청 관리</a>
	    </div>
	    <div class="col text-center bg-light border-0 m-1 p-2" style=" cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/admin/adminManageLector';">
	      <a href="<%=request.getContextPath()%>/admin/adminManageLector" class="text-decoration-none text-reset text-decoration-none text-dark">개설된 강좌 목록</a>
	    </div>
   	    <div class="col text-center bg-light border-0 m-1 p-2" style=" cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/admin/adminManageStudy';">
	      <a href="<%=request.getContextPath()%>/admin/adminManageStudy" class="text-decoration-none text-reset text-decoration-none text-dark">개설된 스터디 목록</a>
	    </div>
   	    <div class="col text-center bg-light border-0 m-1 p-2" style=" cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/admin/adminMemberList';">
	      <a href="<%=request.getContextPath()%>/admin/adminMemberList" class="text-decoration-none text-reset text-decoration-none text-dark">가입 회원 조회</a>
	    </div>
	</div>
