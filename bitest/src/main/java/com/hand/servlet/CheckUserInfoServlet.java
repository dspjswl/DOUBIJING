package com.hand.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CheckUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CheckUserInfoServlet() {
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
		Connection conn =getConnection();
		try {
			Statement st = conn.createStatement();
			String username = request.getParameter("username");
			String sql = "select * from customer where first_name ='"+username+"'";
			ResultSet rs = st.executeQuery(sql);

			if(rs.next()){
				request.getRequestDispatcher("success.jsp").forward(request, response);
				HttpSession session=request.getSession(true);
					session.setAttribute("login","true");
				}
				else
					request.getRequestDispatcher("fail.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
