<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.kh.lector.model.vo.Lector,java.util.List,com.kh.lector.model.vo.LectorChannel" %>
<%
	List<LectorChannel> clist=(List)request.getAttribute("clist");
	int cPage=(int)request.getAttribute("cPage");
	 Lector l=(Lector)request.getAttribute("lector");
	LectorChannel lc=(LectorChannel)request.getAttribute("lc1");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lectorWatch.css" type="text/css"/>

<section>
<%if(loginMember!=null && loginMember.getUserId().equals("admin")||loginMember.getUserId().equals(l.getLectorWriter())){ %>
<div class="container" >
    <a href="<%=request.getContextPath()%>/lector/lectorChannelOpen?cNo=<%=l.getLectorNo() %>" class="btn btn-info" role="button">강좌 추가</a>
    <a href="<%=request.getContextPath()%>/lector/ChannelUpdate?pNo=<%=lc.getChannelNoRef() %>&cNo=<%=lc.getChannelNo() %>" class="btn btn-info" role="button">강좌 수정</a>
    <a href="<%=request.getContextPath() %>/lector/ChannelDelete?pNo=<%=lc.getChannelNoRef() %>&cNo=<%=lc.getChannelNo() %>" class="btn btn-info" role="button">강좌 삭제</a>
</div>
<%} %>

<!--분기처리해서 강좌개설자&admin에게만 보일수 있는 강좌추가,수정,(삭제는 관리자페이지에서만가능) 버튼  -->
  
<%-- <%for(LectorChannel lc : clist) {%> --%>	
 <div id="intro">
  <h2><<%=l.getLectorTitle() %>&nbsp;강좌><h2>
  	<p>제목:&nbsp;&nbsp;<%=lc.getChannelTitle() %><br>
  	금액:&nbsp;&nbsp;<%=lc.getChannelPrice() %>&nbsp;&nbsp;원</p>
 </div>
  
 <div class="watch">
    <div class="video">
      <!-- 855*481 -->
     <%if(lc!=null&&lc.getChannelOriginalVideo()!=null) {%>
		<video src="<%=request.getContextPath() %>/upload/lector/<%=lc.getChannelOriginalVideo() %>" id="video" controls width="855px" height="481px"></video>
    	<%}%>
 	</div>
    <div id="video-inform">
    	<%=lc.getChannelDetail() %>
    </div>
 </div>
	
<p id="list">
	<img src="<%=request.getContextPath() %>/images/list.svg" width="30px" height="auto">
		&nbsp;&nbsp;강의목록
</p>

<div class="container">
	<div class="list-group">
		   <a href="<%=request.getContextPath() %>/lector/lectorView?pNo=<%=l.getLectorNo() %>" class="list-group-item list-group-item-action"><%=l.getLectorTitle() %></a>
	<%if(!clist.isEmpty()){ %>
		 <%for(LectorChannel lc2:clist){ %>
    	<a href="<%=request.getContextPath() %>/lector/channelView?pNo=<%=l.getLectorNo() %>&cNo=<%=lc2.getChannelNo() %>" class="list-group-item list-group-item-action"><%=lc2.getChannelTitle() %></a>
  		<%}
		}%>
  	</div>
</div>

<%if(!clist.isEmpty()){ %>
	<ul class="pagination">
		<%=request.getAttribute("pageBar") %>
	</ul>
<%} %>
</section>
<style>
.pagination{
	margin-top:100px;
	margin-left:600px;
}

</style>

<%@ include file="/views/common/footer.jsp"%>
