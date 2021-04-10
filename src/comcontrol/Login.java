package comcontrol;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnection;
import com.model.User;

@WebServlet(urlPatterns = {"/check-login"})
public class Login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		PrintWriter printWriter = resp.getWriter();
		
		//Lấy thông tin từ form người dùng
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		//Neu chua co du lieu post len
		if(username != null && password != null) {
			//Kiểm tra có hợp lệ so với cơ sở dữ liệu không
			boolean check = false;
			List<User> userList = new ArrayList<User>();
			Connection con = DBConnection.getConnection();
			String sql = "select * from user";
			try {
				PreparedStatement prepared = con.prepareStatement(sql);
				var result = prepared.executeQuery();
				while(result.next()) {
					User user = new User(result.getString("username"), result.getString("password"));
					userList.add(user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//Nếu hợp lệ, chuyển tới trang tìm kiếm
			for(int i = 0; i < userList.size(); i++) {
				if(userList.get(i).getUsername().equals(username) && userList.get(i).getPass().equals(password)) {
					req.setAttribute("u", userList.get(i));
					RequestDispatcher dispatcher = req.getRequestDispatcher("/view/findbook.jsp");//tuong no chuyen toi link nay
					dispatcher.forward(req, resp);
					check=true;
				}
			}
			//Nếu không, báo lỗi, quay lại trang login
			if(!check) {
				printWriter.println("Error Username or Password");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/view/login.jsp");
				dispatcher.include(req, resp);
			}
		}
		else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/login.jsp");
			dispatcher.forward(req, resp);
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
