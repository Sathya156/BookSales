

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Addressbook
 */
@WebServlet("/Addressbook")
public class Addressbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con=null;
       Statement ps=null;
       ResultSet rs=null;
       String URL="jdbc:mysql://localhost:3306/book";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addressbook() {
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
			con=(Connection) DriverManager.getConnection(URL,"root","");
			ps=(Statement) con.createStatement();
			String abc=request.getParameter("email");
			rs=ps.executeQuery("select * from register where email='"+abc+"';");
			if(rs.next())
			{
				out.println("<html><head><title>Addressbook</title></head>");
				out.println("<body><table border=5><tr><th>Fname</th><th>Lname</th><th>Uname</th><th>gender</th><th>Date</th><th>Address");
				out.println("<th>Pin</th><th>Mobno</th><th>Email</th><th>city</th><th>State</th></tr>");
				out.println("<tr><td>");
				out.println(rs.getString(1));
				out.println("</td><td>");
				out.println(rs.getString(2));
				out.println("</td><td>");
				out.println(rs.getString(3));
				out.println("</td><td>");
				out.println(rs.getString(4));
				out.println("</td><td>");
				out.println(rs.getString(5));
				out.println("</td><td>");
				out.println(rs.getString(6));
				out.println("</td><td>");
				out.println(rs.getString(7));
				out.println("</td><td>");
				out.println(rs.getString(8));
				out.println("</td><td>");
				out.println(rs.getString(9));
				out.println("</td><td>");
				out.println(rs.getString(10));
				out.println("</td><td>");
				out.println(rs.getString(11));
				out.println("</td></tr></table></body></html>");
			}
			else
			{
				out.println("invalid details");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
