import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/EditMedicine")
public class EditMedicine extends HttpServlet{
			public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{	
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "asad226646");
					Statement s=con.createStatement();
					int rs = s.executeUpdate("update medicines set medicine = json_replace(medicine, '$.quantity',"+ req.getParameter("qty")+
					",'$.price'," + req.getParameter("price")+") where medicine->>'$.name' = '"+req.getParameter("name")+"'");
					res.getWriter().println(rs);
					con.close();
				} catch (SQLException | ClassNotFoundException e) {
					e.printStackTrace();
				}
            }
        }
