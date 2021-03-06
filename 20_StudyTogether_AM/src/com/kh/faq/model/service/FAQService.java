package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.faq.model.dao.FAQDao;
import com.kh.faq.model.vo.FAQ;

public class FAQService {
	
	private FAQDao dao = new FAQDao();
	
	public List<FAQ> searchFAQ(int cPage, int numPerPage, String category){
		Connection conn = getConnection();
		List<FAQ> list = dao.searchFAQ(conn, cPage, numPerPage, category);
		
		
		close(conn);
		return list;
		
		
	}

	public int faqCount(String category) {
		Connection conn = getConnection();
		int result = dao.faqCount(conn, category);
		close(conn);
		return result;
	}

	public FAQ selectFaq(int no) {
		
		Connection conn = getConnection();
		FAQ q = dao.selectFAQ(conn, no);
		close(conn);
		return q;
		
		
	}

	public int insertFaq(FAQ f) {
		
		Connection conn = getConnection();
		int result = dao.insertFaq(conn, f);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		
		return result;
		
		
		
	}

	public int updateFaq(FAQ f) {
		
		Connection conn = getConnection();
		int flag = dao.updateFaq(conn, f);
		
		if(flag>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return flag;
		
		
	}

	public int deleteFaq(FAQ f) {
		Connection conn = getConnection();
		int flag = dao.deleteFaq(conn, f);
		
		if(flag>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return flag;
		
	}
	
	public List<FAQ> searchFormFAQ(int cPage, int numPerPage, String title) {
		Connection conn = getConnection();
		List<FAQ> list = dao.searchFormFAQ(conn, cPage, numPerPage, title);
		
		
		close(conn);
		return list;
	}

	public int searchFormCount(String title) {
		Connection conn = getConnection();
		int result = dao.faqFormCount(conn, title);
		close(conn);
		return result;
	}
	
	

	
}
