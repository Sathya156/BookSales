

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Abcd
 */
@WebServlet("/Abcd")
public class Abcd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;			//For creating coonection between html and sql the variable con is used
	Statement ps=null;				//For creating query statement that must be executed
	ResultSet rs=null;
		//default line
	String URL="jdbc:mysql://localhost:3306/book";//default line but database must be changed
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Abcd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection(URL,"root","");//url string is included,root is the username of the dastabase and abcd is the password.
			ps=(Statement) con.createStatement();//default line to create statement
			String  sdob=request.getParameter("book");// to get value from form.
			ps.executeUpdate("delete from cbookdetails where uname='satzz' and book='"+sdob+"';");//query for execution. executeupdate() for insert and delete and update;;; executequery() for selecting from the database.//ignore the error.
			response.sendRedirect("resell.html");//rediection o next page"resell.html"
		}
		catch(Exception e)
		{
			out.println(e);
		}	

	}
}
