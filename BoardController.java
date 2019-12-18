package board;

import java.io.*;
// import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.annotation.WebServlet;

// �옄諛� �겢�옒�뒪 import
import java.util.ArrayList;


@WebServlet(description = "board Controller �꽌釉붾┸", urlPatterns = { "/board/BoardController" })
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
			* @author 	源��꽦�깮
			* @date 	2019-10-31
			*
			* @param 	action
			*
			* @remark	媛믪뿉�뵲�씪 硫붿냼�뱶瑜� �떎瑜닿쾶�옉�슜 [2019-10-31; 源��꽦�깮] \n
			*
			*/			
				
			BoardDAO boardDAO = new BoardDAO();
				
			if(action.equals("list")) {
				
				ArrayList<BoardDTO> boardList = boardDAO.getDBList();

				
				request.setAttribute("boardList", boardList);

				pageContext.forward("board_list.jsp");

			}
			else if (action.equals("register"))
			{
				pageContext.forward("register.jsp");
			}
			else if (action.equals("login"))
			{
				pageContext.forward("login.jsp");
			}
			else if (action.equals("create"))
			{
				UserDTO data = new UserDTO();
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");

				System.out.println("ID : " + id);
				System.out.println("PW : " + pw);
				
				data.setUserName(id);
				data.setPassword(pw);
				boardDAO.CreateAccount(data);

				pageContext.forward("board_list.jsp");
			}
			else if (action.equals("check"))
			{
				UserDTO data = new UserDTO();
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");

				System.out.println("ID : " + id);
				System.out.println("PW : " + pw);
				
				data.setUserName(id);
				data.setPassword(pw);
				if (boardDAO.CheckAccount(data))
				{
					request.setAttribute("login_result", true);
				}
				else
				{
					request.setAttribute("login_result", false);
				}
				request.setAttribute("login_status", "result");
				pageContext.forward("login.jsp");
			}
			else if(action.equals("add")) {
			
				request.setAttribute("action", action);
				
				pageContext.forward("board_view.jsp");
			
			} else if(action.equals("insert")) {
				
				if(boardDAO.insertDB(boardDTO)) {

					ArrayList<BoardDTO> boardList = boardDAO.getDBList();
					
					request.setAttribute("boardList", boardList);

					pageContext.forward("board_list.jsp");
					
				} else {
					throw new Exception("DB �엯�젰�삤瑜�");
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
					throw new Exception("DB �닔�젙�삤瑜�");
				}
				
			} else if(action.equals("delete")) {

				if(boardDAO.deleteDB(Integer.parseInt((String)request.getParameter("id")))) {

					ArrayList<BoardDTO> boardList = boardDAO.getDBList();
					
					request.setAttribute("boardList", boardList);

					pageContext.forward("board_list.jsp");
				} else {
					throw new Exception("DB �궘�젣�삤瑜�");
				}
				
			} else {
				
				out.println("<script>alert('action �뙆�씪誘명꽣瑜� �솗�씤�빐 二쇱꽭�슂!!!')</script>");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
