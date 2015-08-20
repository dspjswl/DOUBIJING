package com.hand.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

//import com.hand.Bean.MyBean;

public class HandleShowList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public HandleShowList() {
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
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn =  getConnection();
		StringBuffer str = new StringBuffer();
//		MyBean bean = new MyBean();
		
		HttpSession session=request.getSession(true); 
	      String logininfo=(String) session.getAttribute("login");
	      if(logininfo==null){
	         response.sendRedirect("login.jsp");   
	      }
	      else
	      {  RequestDispatcher rd = request.getRequestDispatcher("List.jsp");
	      		rd.forward(request, response);
	      }
		} 
		
}
