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
	try {
		Statement st = conn.createStatement();
		String sql = "SELECT film_id,title,description,language.name  FROM film left join language on film.language_id=language.language_id limit 0,2000";
		ResultSet rs = st.executeQuery(sql);
			out.print("<table border=2>");
			out.print("<tr>");
			out.print("<td>id</td>"); 
			out.print("<td>Title</td>");
	      	out.print("<td>Description</td>");
	      	out.print("<td>Language</td>");
	      	out.print("<td><a href='insert.jsp'>新增</a></td>");
	      	out.print("</tr>");
			while(rs.next()){
					out.print("<tr>");
					out.print("<td>"+rs.getInt(1)+"</td>"); 
					out.print("<td>"+rs.getString(2)+"</td>");
	              out.print("<td>"+rs.getString(3)+"</td>");
	              out.print("<td>"+rs.getString(4)+"</td>");
	              out.print("<td><a href='edit.jsp'>编辑</a></td>");
	              out.print("<td><a href='delete.jsp'>删除</a></td>");
	              out.print("</tr>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	%>
	<%-- 	<jsp:getProperty name="show" property="result"/> --%>
	</center>
</body>
</html>