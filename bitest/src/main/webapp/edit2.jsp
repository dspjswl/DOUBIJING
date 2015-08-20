<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<%! 
	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return con;
	}	
	%>
	<%
	Connection conn =  getConnection();
	StringBuffer str = new StringBuffer();
	String edit_id = request.getParameter("edit_id");
	try {
		Statement st = conn.createStatement();
		String sql = "SELECT film_id,title,description,language.name  FROM film left join language on film.language_id=language.language_id where film_id ="+edit_id;
		ResultSet rs = st.executeQuery(sql);
		rs.next();	
		out.print("<form action='com.hand.servlet.HandleEdit'>");
		out.print("film_id:<input type='text' name='film_id' value='"+rs.getString(1)+"' readonly><br>");
		out.print("title:<input type='text' name='title' value='"+rs.getString(2)+"'><br>");
		out.print("description:<input type='text' name='description' value='"+rs.getString(3)+"'><br>");
		out.print("Language:<select name='language'>");
		out.print("language<option>English</option>");
		out.print("language<option>Italian</option>");
		out.print("language<option>Japanese</option>");
		out.print("language<option>Mandarin</option>");
		out.print("language<option>French</option>");
		out.print("language<option>German</option>");
		out.print("<br><input type='submit'>");
		out.print("</form>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	%>
	</center>
</body>
</html>