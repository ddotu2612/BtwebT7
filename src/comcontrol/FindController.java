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
import com.model.Book;

@WebServlet(urlPatterns = {"/check-find"})
public class FindController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		String nameBook = req.getParameter("search");
		if(nameBook != null) {
			req.getSession().setAttribute("name_find", nameBook);
		}else {
			nameBook = (String)req.getSession().getAttribute("name_find");
			req.setAttribute("information-update-succees", "true");
		}
		List<Book> books = new ArrayList<Book>();
		if(nameBook != null) {
			Connection connection = DBConnection.getConnection();
			String sql = "select * from book where name like '%" + nameBook + "%'";
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
			req.setAttribute("name1", nameBook);
			req.setAttribute("books", books);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/findbook.jsp");
			dispatcher.forward(req, resp);
			
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/login.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
