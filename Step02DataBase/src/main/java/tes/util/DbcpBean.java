package tes.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	// 필드
	private Connection conn;
	// 생성자
	public DbcpBean() {
		try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		// Server/context.xml 문서에 설정된 jdbc/myoracle 이라는 이름의 DataSource 를 얻는다.
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		// 얻은 DataSource 객체를 이용해 Connection 객체의 참조값을 얻어와서 필드에 저장
		conn = ds.getConnection();
		// 예외가 발생하지 않고 여이까지 실행의 흐름이 넘어오면 성공
		System.out.println("Connection 얻기 성공");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// Connection 객체를 리턴하는 메소드
	public Connection getConn() {
		return conn;
	}
}