package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune") // 3.
public class FortuneServlet extends HttpServlet{ // 1.
	@Override // 2.
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 운세를 얻기 위한 로직 수행 ( DB 에서 읽었다고 가정 )
		String fortune = "동쪽에서 귀인을 만나요.";
		
		/*
		 *	HttpServletRequest 객체의 setAttribute ( key , value ) 메소드를 이용해 응답에 필요한
		 *	데이터를 담을 수 있다.
		 *	담은 데이터는 응답 전까지 유효하며 응답이 끝난 뒤에는 없어지는 1회성 데이터이다.
		 *	담은 데이터를 얻는 방법은
		 *	HttpServletRequest 객체의 getAttribute ( key ) 메소드를 활용한다.
		 *	단 , 담을 때 Object type 으로 받기에 어떤 type 이든 담을 수 있지만
		 *	얻어낼 때에도 역시 Object type 으로 return 하기 때문에 원래 type 을 기억하다가
		 *	casting 을 해야한다.
		 *
		 *	예시
		 *	"fortuneToday" 라는 key 값으로 String type 을 담으면
		 *	얻어낼 때에 아래와 같은 code 가 된다.
		 *
		 *	String a = (String)request.getAttribute("fortuneToday");
		 */
		req.setAttribute("fortuneToday", fortune);
		
		// 응답을 여기서 안하고 JSP 페이지로 응답을 위임
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		/* 
		 * forward
		 * 
		 * webapp/test/fortune.jsp 페이지에게 응답을 대신하게하고
		 * Servlet 에서 전달받은 HttpServletRequest , HttpServletResponse 객체의 참조값을 전달한다.
		 */
		rd.forward(req, resp);
	}
}