package board;

import java.io.*;
// import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.annotation.WebServlet;

// 자바 클래스 import
import java.util.ArrayList;


@WebServlet(description = "board Controller 서블릿", urlPatterns = { "/board/BoardController" })
public class BoardController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final javax.servlet.jsp.JspFactory _jspxFactory = javax.servlet.jsp.JspFactory.getDefaultFactory();
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PageContext pageContext = null;
		
		try {

			pageContext = _jspxFactory.getPageContext(this, request, response, null, true, 8192, true);
		

			request.setCharacterEncoding("UTF-8");
			
			response.setContentType("text/html; charset=UTF-8");
	
			String action = request.getParameter("action");
				System.out.println("Controller action = " + action);


			PrintWriter out = response.getWriter();
			
			BoardDTO boardDTO = new BoardDTO();
					
			if((action.equals("insert")) || (action.equals("update"))) {
			
				boardDTO.setUser(request.getParameter("user"));
				boardDTO.setTitle(request.getParameter("title"));
				boardDTO.setDate(request.getParameter("date"));
				boardDTO.setContent(request.getParameter("content"));
			}
			
			/**
			*
			* @fn 		action.equals()
			* 
			* @brief 	control
			*
			* @author 	김성택
			* @date 	2019-10-31
			*
			* @param 	action
			*
			* @remark	값에따라 메소드를 다르게작용 [2019-10-31; 김성택] \n
			*
			*/			
				
			BoardDAO boardDAO = new BoardDAO();
				
			if(action.equals("list")) {
				
				ArrayList<BoardDTO> boardList = boardDAO.getDBList();

				
				request.setAttribute("boardList", boardList);

				pageContext.forward("board_list.jsp");

			} else if(action.equals("add")) {
			
				request.setAttribute("action", action);
				
				pageContext.forward("board_view.jsp");
			
			} else if(action.equals("insert")) {
				
				if(boardDAO.insertDB(boardDTO)) {

					ArrayList<BoardDTO> boardList = boardDAO.getDBList();
					
					request.setAttribute("boardList", boardList);

					pageContext.forward("board_list.jsp");
					
				} else {
					throw new Exception("DB 입력오류");
				}
				
			} else if(action.equals("edit")) {
				
				boardDTO = boardDAO.getDB(Integer.parseInt((String)request.getParameter("id")));
				
				request.setAttribute("action", action);
				
				request.setAttribute("boardDTO", boardDTO);
				pageContext.forward("board_view.jsp");
				
				
			} else if(action.equals("read")) {
				
				boardDTO = boardDAO.getDB(Integer.parseInt((String)request.getParameter("id")));
				
				request.setAttribute("action", action);
				
				request.setAttribute("boardDTO", boardDTO);
				pageContext.forward("board_read.jsp");
				
				
			} else if(action.equals("update")) {

				if(boardDAO.updateDB(Integer.parseInt((String)request.getParameter("id")), boardDTO)) {

					ArrayList<BoardDTO> boardList = boardDAO.getDBList();
					
					request.setAttribute("boardList", boardList);

					pageContext.forward("board_list.jsp");
				} else {
					throw new Exception("DB 수정오류");
				}
				
			} else if(action.equals("delete")) {

				if(boardDAO.deleteDB(Integer.parseInt((String)request.getParameter("id")))) {

					ArrayList<BoardDTO> boardList = boardDAO.getDBList();
					
					request.setAttribute("boardList", boardList);

					pageContext.forward("board_list.jsp");
				} else {
					throw new Exception("DB 삭제오류");
				}
				
			} else {
				
				out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
