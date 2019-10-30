package board;

public class BoardDTO {

	private int id;
	private String user;
	private String title;
	private String date;
	private String content;
	
	/**
	 *
	 * @fn 		get,set()
	 * 
	 * @brief 	dto
	 *
	 * @author 	김성택
	 * @date 	2019-10-09
	 *
	 *
	 * @remark	데이터를 넘겨받고 넘겨주는 역할수행	[2019-09-09; 김성택] \n
	 *
	 */
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

		
}
