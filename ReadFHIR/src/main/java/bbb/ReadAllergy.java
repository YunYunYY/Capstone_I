package bbb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReadAllergy
 */
public class ReadAllergy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadAllergy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] para = new String[3];
		   for (int i=0; i<para.length; i++)
			para[i] = request.getParameter("f"+i);
		   for (int i=0; i<para.length; i++)
			System.out.println(para[i]);
		   try {
			DoMySQL(para);
		   } catch (Exception e) {
			System.out.println("Error ");
			e.printStackTrace();
		   }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	void DoMySQL(String[] p) throws Exception {
	    String dburl = "jdbc:mysql://localhost:3306/testemr?useSSL=false";
	    String dbUser = "root", dbpwd = "root";

	   Class.forName("com.mysql.cj.jdbc.Driver");
	   Connection conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
	   String sql = "INSERT INTO patient VALUES (";
	   for (int i=0; i<p.length-1; i++) {
		if (p[i]=="") sql += "NULL, ";
		else sql += "'" +p[i]+"',";
	   }
	   if (p[p.length-1] =="") sql += "NULL);";
	   else sql += "'" +p[p.length-1]+"');";
	   System.out.println(sql);	// SQL insert 문장을 만들어 출력해 봄

	   PreparedStatement ps = conn.prepareStatement(sql);
	   ps.execute(sql);
	}

}
