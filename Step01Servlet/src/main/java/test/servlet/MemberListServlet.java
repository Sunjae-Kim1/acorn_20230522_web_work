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

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		// 클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻기
		PrintWriter pw = resp.getWriter();
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1 , "김구라" , "노량진"));
		list.add(new MemberDto(2 , "해골" , "행신동"));
		list.add(new MemberDto(3 , "원숭이" , "상도동"));
				
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>/member/list.jsp</title>");
		pw.println("<style type=\"text/css\">\r\n"
				+ "	table{\r\n"
				+ "		border-collapse: collapse;\r\n"
				+ "		margin-left: 500px;\r\n"
				+ "		margin-top: 300px;\r\n"
				+ "		width:500px;\r\n"
				+ "		height:300px;\r\n"
				+ "		text-align: center;\r\n"
				+ "	}\r\n"
				+ "</style>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("<table border = '1'>");
		pw.println("<thead>");
		pw.println("<tr>");
		
		pw.println("<th>번호</th>");
		pw.println("<th>이름</th>");
		pw.println("<th>주소</th>");
		
		pw.println("</tr>");
		pw.println("</thead>");
		pw.println("<tbody>");
		
		for(MemberDto tmp:list) {
			pw.println("<tr>");
			pw.println("<td>" + tmp.getNum() + "</td>");
			pw.println("<td>" + tmp.getName() + "</td>");
			pw.println("<td>" + tmp.getAddr() + "</td>");
			pw.println("</tr>");
		}
		
		pw.println("</tbody>");
		pw.println("</table>");
				
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}