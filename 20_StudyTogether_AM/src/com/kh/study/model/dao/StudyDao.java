package com.kh.study.model.dao;

import static com.kh.common.JDBCTemplate.close;//static import!

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.join.model.vo.StudyJoin;
import com.kh.lector.model.dao.LectorDao;
import com.kh.lector.model.vo.Lector;
import com.kh.study.model.vo.Study;

public class StudyDao {

	private Properties prop=new Properties();
	
	public StudyDao() {
		try {
			String path=StudyDao.class.getResource("/sql/study/study-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int insertStudy(Connection conn, Study s) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertStudy");
		try {
			pstmt=conn.prepareStatement(sql);
			//pstmt.setInt(1,s.getStudyNo());
			pstmt.setString(1, s.getStudyName());
			pstmt.setString(2, s.getStudyWriter());
			pstmt.setString(3, s.getStudyCategory());
			pstmt.setString(4, s.getStudyPossibleDay());
			pstmt.setString(5, s.getStudyArea());
			pstmt.setString(6, s.getStudyDetail());
			pstmt.setInt(7, s.getMaxMember());
			//pstmt.setInt(8, s.getNowMember());
			//pstmt.setDate(9, s.getEnrollDate());
			//System.out.println(s.getEndDate().replaceAll("-", "/"));
			pstmt.setString(8, s.getEndDate().replaceAll("-", "/"));
			pstmt.setString(9, s.getOriImg());
			pstmt.setString(10, s.getReImg());
			//pstmt.setString(13, s.getDateAssign());
			//pstmt.setString(14, s.getMemberAssign());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	

	public List<Study> searchStudy(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchStudy");
		List<Study> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Study s=new Study();
				s.setStudyNo(rs.getInt("STUDY_NO"));
				s.setStudyName(rs.getString("STUDY_NAME"));
				s.setStudyWriter(rs.getString("STUDY_WRITER"));
				s.setStudyCategory(rs.getString("STUDY_CATEGORY"));
				s.setStudyPossibleDay(rs.getString("STUDY_POSSIBLE_DAY"));
				s.setStudyArea(rs.getString("STUDY_AREA"));
				s.setStudyDetail(rs.getString("STUDY_DETAIL"));
				s.setMaxMember(rs.getInt("STUDY_MAX_MEMBER"));
				s.setEnrollDate(rs.getDate("STUDY_DATE"));
				s.setEndDate(rs.getString("STUDY_END_DATE"));
				s.setOriImg(rs.getString("STUDY_ORIGINAL_IMG"));
				s.setReImg(rs.getString("STUDY_RENAMED_IMG"));
				s.setDateAssign(rs.getString("STUDY_DATE_ASSIGN"));
				s.setMemberAssign(rs.getString("STUDY_MEMBER_ASSIGN"));
				list.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int studyCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("studyCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);//카운트행
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
//studyView 스터디 조회메서드
	public Study selectStudy(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql=prop.getProperty("selectStudy");
		Study s=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
		if(rs.next())
			s=new Study();
			s.setStudyNo(rs.getInt("STUDY_NO"));
			s.setStudyName(rs.getString("STUDY_NAME"));
			s.setStudyWriter(rs.getString("STUDY_WRITER"));
			s.setStudyCategory(rs.getString("STUDY_CATEGORY"));
			s.setStudyPossibleDay(rs.getString("STUDY_POSSIBLE_DAY"));
			s.setStudyArea(rs.getString("STUDY_AREA"));
			s.setStudyDetail(rs.getString("STUDY_DETAIL"));
			s.setMaxMember(rs.getInt("STUDY_MAX_MEMBER"));
			s.setEnrollDate(rs.getDate("STUDY_DATE"));
			s.setEndDate(rs.getString("STUDY_END_DATE"));
			s.setOriImg(rs.getString("STUDY_ORIGINAL_IMG"));
			s.setReImg(rs.getString("STUDY_RENAMED_IMG"));
			s.setDateAssign(rs.getString("STUDY_DATE_ASSIGN"));
			s.setMemberAssign(rs.getString("STUDY_MEMBER_ASSIGN"));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return s;
	}


	//지현 -리뷰
	public List<Study> selectStudyName(Connection conn,String writer) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=prop.getProperty("selectStudyName");
		List<Study> list = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Study s =new Study();
			
				s.setStudyName(rs.getString("STUDY_NAME"));
		
				list.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int deleteStudy(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteStudy");
		
		try {
			Study s=new Study();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	public List<Study> searchStudyPage(Connection conn, String area, String searchType, String day) {

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchStudyPage2");
		List<Study> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,area);
			pstmt.setString(2, searchType);
			pstmt.setString(3, day);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Study s=new Study();
				s.setStudyNo(rs.getInt("STUDY_NO"));
				s.setStudyName(rs.getString("STUDY_NAME"));
				s.setStudyWriter(rs.getString("STUDY_WRITER"));
				s.setStudyCategory(rs.getString("STUDY_CATEGORY"));
				s.setStudyPossibleDay(rs.getString("STUDY_POSSIBLE_DAY"));
				s.setStudyArea(rs.getString("STUDY_AREA"));
				s.setStudyDetail(rs.getString("STUDY_DETAIL"));
				s.setMaxMember(rs.getInt("STUDY_MAX_MEMBER"));
				s.setEnrollDate(rs.getDate("STUDY_DATE"));
				s.setEndDate(rs.getString("STUDY_END_DATE"));
				s.setOriImg(rs.getString("STUDY_ORIGINAL_IMG"));
				s.setReImg(rs.getString("STUDY_RENAMED_IMG"));
				s.setDateAssign(rs.getString("STUDY_DATE_ASSIGN"));
				s.setMemberAssign(rs.getString("STUDY_MEMBER_ASSIGN"));
				list.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateStudy(Connection conn, Study s) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateStudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s.getStudyName());
			pstmt.setString(2, s.getStudyCategory());
			pstmt.setString(3, s.getStudyPossibleDay());
			pstmt.setString(4, s.getStudyArea());
			pstmt.setString(5, s.getStudyDetail());
			pstmt.setInt(6, s.getMaxMember());
			pstmt.setString(7, s.getEndDate());
			pstmt.setString(8, s.getOriImg());
			//pstmt.setString(9, s.getReImg());
			//pstmt.setString(11, s.getDateAssign());
			//pstmt.setString(12, s.getMemberAssign());
			pstmt.setInt(9, s.getStudyNo());
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertJoin(Connection conn, StudyJoin sj) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertStudyJoin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sj.getStudyNo());
			pstmt.setString(2, sj.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
		
	
}
