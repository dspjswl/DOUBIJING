package com.hand.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class HandleEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public HandleEdit() {
        super();
    }
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = getConnection();
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String language = request.getParameter("language");
		String film_id=request.getParameter("film_id");
		int language_id=0;
		if(language.equals("English")) language_id=1;
		if(language.equals("Italian")) language_id=2;
		if(language.equals("Japanese")) language_id=3;
		if(language.equals("Mandarin")) language_id=4;
		if(language.equals("French")) language_id=5;
		if(language.equals("German")) language_id=6;
		try {
			Statement st = conn.createStatement();
			System.out.println(film_id);
			//String sql = "update film set title = '"+title+"',description='"+description+"',language_id="+language_id+" where film_id="+film_id;
			String sql = "update film set title = '"+title+"',description = '"+description+"',language_id="+language_id+" where film_id="+film_id;

			st.execute(sql);
			conn.close();
			RequestDispatcher rd = request.getRequestDispatcher("editsuccess.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
