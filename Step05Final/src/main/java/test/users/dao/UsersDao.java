package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	// 외부에서 객체 생성할 수 없도록
	private UsersDao() {}
	// 참조값을 리턴하는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao = new UsersDao();
		}
		return dao;
	}
	
	// 비밀번호를 수정하는 메소드
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update users"
					+ " set pwd = ?"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
			// sql 수행 후 변화된 ( 추가 , 삭제 , 수정 ) row 의 갯수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	} // updatePwd()
	
	// 프로필 이미지 경로를 수정하는 메소드
	public boolean updateProfile(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update users"
					+ " set profile = ?"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getProfile());
			pstmt.setString(2, dto.getId());
			// sql 수행 후 변화된 ( 추가 , 삭제 , 수정 ) row 의 갯수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	} // updateProfile()
	
	// 회원 한명의 정보를 리턴하는 메소드
	public UsersDto getData(String id) {
		UsersDto dto =  null;
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select pwd , email , profile , regdate"
					+ " from users"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, id);
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // Connection 이 Connection Pool 에 반납
			} catch (Exception e) {
			}
		}
		return dto;
	} // getData
	
	public boolean isValid(UsersDto dto) {
		 boolean isValid = false;
		
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select id"
					+ " from users"
					+ " where id = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			if (rs.next()) {
				isValid = true;
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // Connection 이 Connection Pool 에 반납
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	// 회원 한 명의 정보를 DB 에 저장하고 성공 여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into users"
					+ " (id , pwd , email , regdate)"
					+ " values(? , ? , ? , sysdate)";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			// sql 수행 후 변화된 ( 추가 , 삭제 , 수정 ) row 의 갯수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	} // insert()
}