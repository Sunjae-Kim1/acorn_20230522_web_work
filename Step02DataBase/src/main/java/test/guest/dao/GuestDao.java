package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import tes.util.DbcpBean;
import test.todo.dto.TodoDto;

public class TodoDao {
	private TodoDao() {}
	
	private static TodoDao dao;
	
	public static TodoDao getInstance() {
		if(dao == null) {
			dao = new TodoDao();
		}
		return dao;
	}
	
	public List<TodoDto> getList() {
		List<TodoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select num , work , addr"
					+ " from todo"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setWork(rs.getString("work"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
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
	}
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into todo"
					+ " (num , work , addr)"
					+ " values(todo_seq.NEXTVAL , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			// sql 미완성 시 여기서 완성
			pstmt.setString(1, dto.getWork());
			pstmt.setString(2, dto.getAddr());
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
}
