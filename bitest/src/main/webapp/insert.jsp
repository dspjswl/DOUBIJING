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
<title>新增界面</title>
</head>
<body>
<center>
<h2>请输入您要新增的电影信息：</h2>
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
	<form action="com.hand.servlet.HandleInsert">
		Title:<input type="text" name="title">
		Description:<input type="text" name="description">
		Language:<select name="language">			
				<%
				Connection conn =  getConnection();
				StringBuffer str = new StringBuffer();
				try {
					Statement st = conn.createStatement();
					String sql = "select name from language";
					ResultSet rs = st.executeQuery(sql);
					while(rs.next()){
						out.print("<option>"+rs.getString("name")+"</option>"); 
					  }
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
		</select>
		<input type="submit">
	</form>
	</center>
</body>
</html>