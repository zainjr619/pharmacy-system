import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/GetCompanies")
public class GetCompanies extends HttpServlet{
			public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{	
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "asad226646");
					Statement s=con.createStatement();
					ResultSet rs = s.executeQuery("select * from companies");
					String result="[";
					while(rs.next()) {
						result += rs.getString(1) + ",";
					}
					if(result.length() > 1)
						result = result.substring(0, result.length()-1);
					result += "]";
					res.getWriter().println(result);
					con.close();
				} catch (SQLException | ClassNotFoundException e) {
					e.printStackTrace();
				}
            }
        }
