package board;

import java.sql.*;
import java.util.ArrayList;

import board.BoardDTO;


public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;


	String jdbc_driver = "com.mysql.jdbc.Driver";
	
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";
	
	/**
	 *
	 * @fn 		connect()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 *
	 * @remark	�뜲�씠�꽣踰좎씠�뒪�뿰寃�	[2019-10-31; 源��꽦�깮] \n
	 *
	 */
	
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 *
	 * @fn 		disconnect()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 *
	 * @remark	�뜲�씠�꽣踰좎씠�뒪�빐�젣	[2019-10-31; 源��꽦�깮] \n
	 *
	 */		

	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 *
	 * @fn 		insertDB()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 * @param 	boardDTO
	 *
	 * @remark	�뜲�씠�꽣踰좎씠�뒪�뿉 �젙蹂댁엯�젰	[2019-10-31; 源��꽦�깮] \n
	 *
	 */	

	public boolean insertDB(BoardDTO boardDTO) {
		
		
		connect();
		
				
		String sql ="insert into Board(user,title,date,content) values(?,?,?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1,boardDTO.getUser());
			pstmt.setString(2,boardDTO.getTitle());
			pstmt.setString(3,boardDTO.getDate());
			pstmt.setString(4,boardDTO.getContent());
			

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	

	public void CreateAccount(UserDTO data)
	{
		connect();
		String query = "insert into Users(userName, password) values(?,?)";
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,data.getUserName());
			pstmt.setString(2,data.getPassword());

			pstmt.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			disconnect();
		}
	}
	public boolean CheckAccount(UserDTO data)
	{
		connect();
		String query = "select * from Users where userName=? and password=?";
		boolean result = false;
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,data.getUserName());
			pstmt.setString(2,data.getPassword());

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.first();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return result;
	}
	
	public ArrayList<BoardDTO> getDBList() {
		
		connect();
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		String sql = "select id,user,title,date,content from Board";

		try {
			
			pstmt = conn.prepareStatement(sql);
			

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				

				BoardDTO boardDTO = new BoardDTO();
				

				boardDTO.setId(rs.getInt("id"));
				boardDTO.setUser(rs.getString("user"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setDate(rs.getString("date"));
				boardDTO.setContent(rs.getString("content"));
				
				boardList.add(boardDTO);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardList;
	}
	
	/**
	 *
	 * @fn 		getDB()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 * @param 	id
	 *
	 * @remark	�떒�씪�젙蹂댁“�쉶 硫붿냼�뱶 [2019-10-31; 源��꽦�깮] \n
	 *
	 */	
	
	
	public BoardDTO getDB(int id) {
		
		connect();
		
		BoardDTO boardDTO = new BoardDTO();
		
		String sql = "select * from Board where id = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1,id);


			ResultSet rs = pstmt.executeQuery();


			rs.next();
			

			boardDTO.setId(rs.getInt("id"));
			boardDTO.setUser(rs.getString("user"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setDate(rs.getString("date"));
			boardDTO.setContent(rs.getString("content"));
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardDTO;
	}
	
	/**
	 *
	 * @fn 		getRead()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 * @param 	id
	 *
	 * @remark	�닔�젙�솕硫댁“�쉶 硫붿냼�뱶 [2019-10-31; 源��꽦�깮] \n
	 *
	 */
	
	public BoardDTO getRead(int id) {
		
		connect();
		
		BoardDTO boardDTO = new BoardDTO();
		
		String sql = "select * from Board where id = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1,id);


			ResultSet rs = pstmt.executeQuery();


			rs.next();
			

			boardDTO.setId(rs.getInt("id"));
			boardDTO.setUser(rs.getString("user"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setDate(rs.getString("date"));
			boardDTO.setContent(rs.getString("content"));
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardDTO;
	}

	/**
	 *
	 * @fn 		updateDB()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 * @param 	boardDTO
	 *
	 * @remark	�젙蹂댁닔�젙硫붿냼�뱶 [2019-10-31; 源��꽦�깮] \n
	 *
	 */
	
	public boolean updateDB(int id,BoardDTO boardDTO) {
		
		
		connect();
		
		
		String sql ="update Board set date=?, content=? where id=?";
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1,boardDTO.getDate());
			pstmt.setString(2,boardDTO.getContent());
			pstmt.setInt(3,id);
		

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	/**
	 *
	 * @fn 		deleteDB()
	 * 
	 * @brief 	dao
	 *
	 * @author 	源��꽦�깮
	 * @date 	2019-10-31
	 *
	 * @param 	id
	 *
	 * @remark	�젙蹂댁궘�젣硫붿냼�뱶 [2019-10-31; 源��꽦�깮] \n
	 *
	 */

	public boolean deleteDB(int id) {
		
		
		connect();
		
			
		String sql ="delete from Board where id=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setInt(1,id);
						

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
		}
		return true;
	}
	
	
}

