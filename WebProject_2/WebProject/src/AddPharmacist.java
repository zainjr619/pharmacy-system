import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/AddPharmacist")
public class AddPharmacist extends HttpServlet{
			public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{	
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "asad226646");
					Statement s=con.createStatement();
					String json="json_object('name','"+req.getParameter("name")+"','role','pharmacist','Uname','"+req.getParameter("uName")+
							"','email','"+req.getParameter("mail") +"','password','"+req.getParameter("pass")+"')";
					int rs = s.executeUpdate("insert into users select "+json+
							" where (select user from users where user->>'$.Uname' = '"+req.getParameter("uName")+"' or user->>'$.email' = '"+req.getParameter("mail")+"') is null");
					res.getWriter().println(rs);
					con.close();
				} catch (SQLException | ClassNotFoundException e) {
					e.printStackTrace();
				}
            }
        }
