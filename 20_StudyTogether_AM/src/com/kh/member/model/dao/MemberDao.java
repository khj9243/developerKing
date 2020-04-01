package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public Member selectId(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= prop.getProperty("selectId");
		Member m = null;
		try {			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				
				rs = pstmt.executeQuery();
				
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("user_id"));
				m.setPassword(rs.getString("password"));
				m.setUserName(rs.getString("user_name"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setNickName(rs.getString("nick_name"));
				m.setGender(rs.getString("gender"));
				m.setBirthDate(rs.getDate("birth_date"));			
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setAdminStatus(rs.getString("admin_status").charAt(0));
				System.out.println(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
		
	}
	
	public int memberEnroll(Connection conn, String id, String password, String userName, String email) {

		PreparedStatement pstmt=null;
		String sql= prop.getProperty("memberEnroll");
		int result=0;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, userName);
			pstmt.setString(4, email);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member lookforPassword(Connection conn, String id, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCheckinfo");
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("user_id"));
				m.setPassword(rs.getString("password"));
				m.setUserName(rs.getString("user_name"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setNickName(rs.getString("nick_name"));
				m.setGender(rs.getString("gender"));
				m.setBirthDate(rs.getDate("birth_date"));			
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setAdminStatus(rs.getString("admin_status").charAt(0));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public int updatePassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePassword");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Member> selectMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMember");
		List<Member> list=new ArrayList<Member>();
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("user_id"));
				m.setUserName(rs.getString("user_name"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setNickName(rs.getString("nick_name"));
				m.setGender(rs.getString("gender"));
				m.setBirthDate(rs.getDate("birth_date"));			
				m.setPhone(rs.getString("phone"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int memberUpdate(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberUpdate");
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql);
			//memberUpdate=UPDATE MEMBER SET PASSWORD=?, EMAIL=?, NICN_NAME=?, GENDER=?, BIRTH_DATE=?, PHONE=?, ADDRESS=? WHERE USER_ID=?
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getNickName());
			pstmt.setString(4, m.getGender());
			pstmt.setDate(5, m.getBirthDate());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getUserId());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int memberDelete(Connection conn, String id, String password) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberDelete");
		int result=0;
		System.out.println(id+","+password);
		try {
			pstmt = conn.prepareStatement(sql);
			//memberDelete=DELETE FROM MEMBER WHERE USER_ID=? AND PASSWORD=?
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int duplicateCheck(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("duplicateCheck");
		ResultSet rs = null;
		int result=0;
		System.out.println(id);
		try {
			pstmt = conn.prepareStatement(sql);
			//duplicateCheck=SELECT * FROM MEMBER WHERE USER_ID=?
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	

}
