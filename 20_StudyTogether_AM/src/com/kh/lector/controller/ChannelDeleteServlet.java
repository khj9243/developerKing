package com.kh.lector.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lector.model.service.LectorService;

/**
 * Servlet implementation class ChannelDeleteServlet
 */
@WebServlet("/lector/ChannelDelete")
public class ChannelDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChannelDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		int cNo=Integer.parseInt(request.getParameter("cNo"));
		System.out.println(pNo);
		System.out.println(cNo);
		
		int result=new LectorService().deleteChannel(pNo,cNo);
		System.out.println("삭제RESULT"+result);

		String msg="";
		String loc="";
		
		if(result>0) {
			msg="삭제 완료";
			loc="/lector/lectorView?pNo="+pNo;
		}
		
		else {
			msg="삭제 실패";
			loc="/lector/channelView?pNo="+pNo+"&cNo="+cNo;
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
