package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라" , "노량진"));
		list.add(new MemberDto(2, "해골" , "행신동"));
		list.add(new MemberDto(3, "원숭이" , "상도동"));
		
		// JSP 페이지에 전달할 Model 을 request scope 에 담기
		req.setAttribute("list", list);
		
		// JSP 페이지로 forward
		RequestDispatcher rd = req.getRequestDispatcher("/member/list.jsp");
		rd.forward(req, resp);
	}
}