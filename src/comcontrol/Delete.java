package comcontrol;

import java.io.IOException;
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
import com.model.Book;
@WebServlet(urlPatterns = {"/delete-book"})
public class Delete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		List<Book> books = new ArrayList();
		int id_del = Integer.parseInt(req.getParameter("id"));
		int result_del = 0;
		Connection connection = DBConnection.getConnection();
		try {
			String sql = "delete from book where id="+id_del;
			PreparedStatement prepared = connection.prepareStatement(sql);
			result_del = prepared.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result_del > 0) {
			String sql = "select * from book where name like '%" + ""+ "%'";
			try {
				PreparedStatement prepare = connection.prepareStatement(sql);
				var result = prepare.executeQuery();
				while(result.next()) {
					int id = result.getInt("id");
					String name = result.getString("name");
					String publisher = result.getString("publisher");
					int price = result.getInt("price");
					Book book = new Book(id, name, publisher, price);
					books.add(book);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			req.setAttribute("books", books);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/findbook.jsp");
			dispatcher.forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
