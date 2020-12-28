import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/UpdateMedicines")
public class UpdateMedicines extends HttpServlet{
			public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{	
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "asad226646");
					Statement s=con.createStatement();
					String[] names=req.getParameterValues("name");
					String[] qtys=req.getParameterValues("qty");
					String query="";
					for(int i=0; i<names.length; i++) {
						query += " when '"+names[i]+"' then json_replace(medicine,'$.quantity',medicine->'$.quantity' - "+qtys[i]+") ";
					}
					int rs = s.executeUpdate("update medicines set medicine = (case medicine->>'$.name' "+query+" else medicine end)");
					res.getWriter().println(rs);
					con.close();
				} catch (SQLException | ClassNotFoundException e) {
					e.printStackTrace();
				}
            }
        }

