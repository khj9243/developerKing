<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.kh.lector.model.vo.Lector" %>
<%@ include file="/views/admin/adminHeader.jsp" %>
<%
	List<Lector> list=(List)request.getAttribute("lectorGrantList");
%>
<div class="row">
            <h3>승인요청한 강좌</h3>
            <table class="table">
              <thead class="text-center">
                  <tr>
                    <th>등록 번호</th>
                    <th>이미지</th>
                    <th>강좌명</th>
                    <th>강사명</th>
                    <th>가격</th>
                    <th colspan="2">승인 여부</th>
                    <!-- <th>전송</th> -->
                  </tr>
                </thead>
                <tbody class="text-center">
                  <%if(list.size()>0){ %>
                  <%for(Lector l:list){ %>
		          <form id="lec<%=l.getLectorNo()%>" action="<%=request.getContextPath() %>/admin/adminGrantLectorEnd" class="form-group col">
                  <tr>
                      <td>
                      	<%=l.getLectorNo()%>
                      	<input type="hidden" name="lecNo" value="<%=l.getLectorNo()%>">
                      </td>
                      <td>
                          <img class="img-thumbnail" style="width:80px;height:80px;" src="<%=request.getContextPath() %>/upload/lector/<%=l.getLectorRenamedImg() %>" alt="">
                      </td>
                      <td>
                        <a href="<%=request.getContextPath() %>/lector/lectorView?pNo=<%=l.getLectorNo()%>"><%=l.getLectorTitle() %></a>
                      </td>
                      <td><%=l.getLectorWriter() %></td>
                      <td><%=l.getLectorPrice() %>원</td>
                      <td>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="optradio<%=l.getLectorNo()%>" name="optradio" value="Y">허용
                            </label>
                        </div>
                        <div class="form-check-inline">
	                        <label class="form-check-label">
	                          <input type="radio" class="form-check-input" id="optradio<%=l.getLectorNo()%>" name="optradio" value="N">거부
	                        </label>
                        </div>
                      </td>
                      <td>
                          <button type="button" class="btn btn-primary btn-sm" onclick="confirmGrant(<%=l.getLectorNo()%>);">전송</button>
                      </td>
                  </tr>      
		          </form>
                  <%} %>      
                  <%} else{ %>
                   <tr>
                   	<td colspan="7">현재 개설신청한 강좌가 없습니다.</td>
                   </tr>
                  <%} %>
                </tbody>
              </table>
        </div>
		<script>
			function confirmGrant(no){
				var raCheck=document.getElementsByName('optradio');
	    		var select;
	    		for(let i=0;i>raCheck.length;i++){
	    			if(raChecked[i].checked==true){
	    				select=raCheck[i].value;
	    			}
	    		}
	    		console.log(select);
				
				var str="".concat(String(no));
				let id='lec'.concat(str);
				let form=document.getElementById(id);
				let opt="optradio".concat(str);
				let val=document.getElementById(opt).value;
				
				var check=false;
				if(val=="Y"){
					check=confirm(str+"번 강좌입니다. 이대로 진행하시겠습니까?");
					if(check) form.submit();
					else return;					
				}
			}
		</script>
<%@ include file="/views/admin/adminFooter.jsp" %>
