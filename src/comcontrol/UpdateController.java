package comcontrol;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnection;

@WebServlet(urlPatterns = {"/update-book"})
public class UpdateController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int result =0;
		int id = Integer.parseInt(req.getParameter("id"));
		String name= req.getParameter("name");
		String publisher = req.getParameter("publisher");
		int price = Integer.parseInt(req.getParameter("price"));
		Connection connection = DBConnection.getConnection();
		String sql = "update book set name= '"+ name +"', publisher= '"+ publisher+ "', price=" +price +" where id="+String.valueOf(id);
		try {
			PreparedStatement prepared = connection.prepareStatement(sql);
			result = prepared.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/check-find");
			dispatcher.forward(req, resp);
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
