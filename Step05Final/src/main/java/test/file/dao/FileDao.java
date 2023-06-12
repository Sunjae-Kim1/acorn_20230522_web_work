package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	// static 필드
	private static FileDao dao;
	// 외부에서 객체 생성하지 못하게 생성자를 private 로
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao = new FileDao();
		}
		return dao;
	}
	
	// 1. 삭제할 파일 번호를 이용해 파일정보를 얻는다.
	// 2. 해당 파일을 파일시스템에서 실제로 삭제한다.
	// 3. DB 에서 해당 파일의 정보를 삭제한다.
	// 4. 응답한다.
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete board_file"
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
	
	// 파일 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		FileDto dto = null;
		// 필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			conn = new DbcpBean().getConn();
			String sql = "select writer , title , orgFileName , saveFileName , fileSize , regdate"
					+ " from board_file"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setInt(1, num);
			// select 문 수행 후 결과값 받기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
	
	//업로드된 파일 정보를 DB 에 저장하는 메소드
	   public boolean insert(FileDto dto) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int rowCount = 0;
	      try {
	         conn = new DbcpBean().getConn();
	         String sql = "INSERT INTO board_file"
	               + " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
	               + " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩할게 있으면 해주고
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setString(2, dto.getTitle());
	         pstmt.setString(3, dto.getOrgFileName());
	         pstmt.setString(4, dto.getSaveFileName());
	         pstmt.setLong(5, dto.getFileSize());
	         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
	         rowCount = pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      if (rowCount > 0) {
	         return true;
	      } else {
	         return false;
	      }
	   } // insert()
	   
	   // 전체 글의 갯수를 리턴하는 메소드
	   public int getCount() {
		   int count = 0;
		   // 필요한 객체의 참조값을 담을 지역변수 만들기
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try {
			   // DbcpBean 객체를 이용해서 Connection 객체를 얻어온다. ( Connection Pool 에서 얻기 )
			   conn = new DbcpBean().getConn();
			   String sql = "select max(rownum) as num from board_file";
			   pstmt = conn.prepareStatement(sql);
			   // sql 미완성 시 여기서 완성
			   
			   // select 문 수행 후 결과값 받기
			   rs = pstmt.executeQuery();
			   // 반복문 돌면서 ResultSet 에 담긴 내용 추출
			   while (rs.next()) {
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
	   }
	   
	   public List<FileDto> getList(FileDto dto) {
			List<FileDto> list = new ArrayList<FileDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select *"
							+ "	from"
							+ "		(select result1.* , rownum as rnum"
							+ "		from"
							+ "			(select num , writer , title , orgFileName , saveFileName , fileSize , regdate"
							+ "			from board_file"
							+ "			order by num desc)"
							+ "		result1)"
							+ " where rnum between ? and  ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getStartRowNum());
				pstmt.setInt(2, dto.getEndRowNum());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					FileDto tmp = new FileDto();
					tmp.setNum(rs.getInt("num"));
					tmp.setWriter(rs.getString("writer"));
					tmp.setTitle(rs.getString("title"));
					tmp.setOrgFileName(rs.getString("orgFileName"));
					// tmp.setSaveFileName(rs.getString("saveFileName"));
					tmp.setFileSize(rs.getLong("fileSize"));
					tmp.setRegdate(rs.getString("regdate"));
					list.add(tmp);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch (Exception e) {}
			}
			return list;
		} // List<FileDto>
	   
	   public List<FileDto> getListAll() {
			List<FileDto> list = new ArrayList<FileDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select num , writer , title , orgFileName , saveFileName , fileSize , regdate"
							+ "	from board_file"
							+ "	order by num desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					FileDto tmp = new FileDto();
					tmp.setNum(rs.getInt("num"));
					tmp.setWriter(rs.getString("writer"));
					tmp.setTitle(rs.getString("title"));
					tmp.setOrgFileName(rs.getString("orgFileName"));
					// tmp.setSaveFileName(rs.getString("saveFileName"));
					tmp.setFileSize(rs.getLong("fileSize"));
					tmp.setRegdate(rs.getString("regdate"));
					list.add(tmp);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch (Exception e) {}
			}
			return list;
		} // List<FileDto>
}