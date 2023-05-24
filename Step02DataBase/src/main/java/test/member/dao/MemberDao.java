package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tes.util.DbcpBean;
import test.member.dto.MemberDto;

/*
 * Application 전역에서 MemberDao 객체는 1개만 생성해 사용하는 구조로 만든다.
 * 
 * 1. 외부에서 객체 생상하지 못하게 생성자의 접근 지정자는 private
 * 2. 자신의 참조값은 저장할 수 있도록 static 필드
 * 3. 자신의 참조값을 리턴해줄 public 메소드
 */
public class MemberDao {
	// 2.
	private static MemberDao dao;
	
	// 1.
	private MemberDao() {}
	
	// 3.
	public static MemberDao getInstance() {
		// 서버 시작 후 최초 요청이라면
		if(dao == null) {
			// 객체를 생성해 static 필드에 저장한다.
			dao = new MemberDao();
		}
		// 필드에 저장된 참조값 리턴
		return dao;
	} // getInstance()
	
	//회원 목록 리턴 메소드
	public List<MemberDto> getList(){
		// 회원 목록을 담을 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select num , name , addr"
					+ " from member"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성

			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				// ResultSet 에 cursor 가 위치 한곳의 컬럼 정보를 얻어서 MemberDto 객체에 담고
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// ArrayList 객체에 누적
				list.add(dto);
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
			} catch (Exception e) {}
		}
		// 회원 목록이 있는 ArrayList 객체 리턴
		return list;
	} // getList()
	
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into member"
					+ " (num , name , addr)"
					+ " values(member_seq.NEXTVAL , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			// sql 수행 후 변화된 ( 추가 , 삭제 , 수정 ) row 의 갯수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if(rowCount > 0) {
			return true;
		}else {
			return false;
		}
	} // insert()
	
	public MemberDto getData(int num){
		MemberDto dto = null;
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select name , addr"
					+ " from member"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				dto = new MemberDto();
				dto.setNum(num); // 번호는 지역변수에 있는 것을 담는다.
				// 이름 , 주소는 ResultSet 으로부터 얻어서 담는다.
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
		// 회원 1명의 정보가 담긴 MemberDto 객체 리턴
		return dto;
	} // getData()
	
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update member"
					+ " set name = ? , addr = ?"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
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
	} // update()
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete member"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setInt(1, num);
			// sql 수행 후 변화된 ( 추가 , 삭제 , 수정 ) row 의 갯수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if(rowCount > 0) {
			return true;
		}else {
			return false;
		}
	} // delete()
	
}