package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class ListServlet extends HttpServlet{

	// 2. service() 메소드 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		// 클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻기
		PrintWriter pw = resp.getWriter();
		List<String>names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		
		
		pw.println("<h1>친구 목록입니다.</h1>");
		pw.println("<ul>");
		
//		for(int i = 0; i < names.size(); i++) {
		for(String tmp: names) {
		pw.println("<li>" + tmp +"</li>");
		}
		
		pw.println("</ul>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}