package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	// static 필드
	private static CafeDao dao;
	
	/*
	 * static 메소드는 생성자를 호출하지 않고 클래스 명으로 바로 호출하기 때문에
	 * 메소드 호출 전에 무언가 준비 작업을 하고 싶으면 static 블럭 안에서 한다.
	 * static 블럭은 해당 클래스를 최초로 사용할 때 한번만 실행하면 되기에
	 * 초기화 작업을 하기에 적당하다.
	 */
	
	static {
		// 객체를 생성해서 static 필드에 저장하면
		dao = new CafeDao();
	}
	
	// 외부에서 객체 생성하지 못하게 생성자를 private 로
	private CafeDao() {}
	
	// static 메소드
	public static CafeDao getInstance() {
		// if(dao==null) {
		//	dao = new CafeDao();
		// }
		
		// 여기서 리턴하는 값은 null 이 아니다.
		return dao;
	}
	
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_cafe"
					+ " set viewCount = viewCount + 1"
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
	}
	
	public int getCount() {
		int count = 0;
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select max(rownum) as num from board_cafe";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성

			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			if (rs.next()) {
				count = rs.getInt("num");
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
		return count;
	} // getCount()
	
	public List<CafeDto> getList(CafeDto dto) {
		List<CafeDto> list = new ArrayList<CafeDto>();
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select *"
					+ "	from"
					+ "		(select result1.* , rownum as rnum"
					+ "		from"
					+ "			(select num , writer , title , content , viewCount , to_char(regdate , 'YYYY.MM.DD HH24:MI:SS') as regdate"
					+ "			from board_cafe"
					+ "			order by num desc)"
					+ "		result1)"
					+ " where rnum between ? and  ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				CafeDto tmp = new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				list.add(tmp);
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
		return list;
	} // getList()
	
	public CafeDto getData(int num) {
		CafeDto dto = null;
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select writer , title , content , viewCount , regdate"
						+ " from board_cafe"
						+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
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
	} // getData()
	
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_cafe"
						+ " (num , writer , title , content , viewCount , regdate)"
						+ " values(board_cafe_seq.NEXTVAL , ? , ? , ? , 0 , SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete board_cafe"
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
	} // delete()
	
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_cafe"
					+ " set title = ? , content = ?"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
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
}