package aaa;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPatient
 */
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] para = new String[8];
		for(int i=0;i<8;i++)
			para[i]=request.getParameter("f"+i);
		for(int i=0;i<8;i++)
			System.out.println(para[i]);
		try {
			DoMySQL(para);
		}
		catch(Exception e) {
			System.out.println("Error ");
			e.printStackTrace();
		}
		/*
		System.out.println(request.getParameter("f1"));
		System.out.println(request.getParameter("f2"));
		response.getWriter().append("Served at: ").append(request.getContextPath());
		*/
		response.getWriter().append("Done");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	void DoMySQL(String[] p) throws Exception{
		String dburl = "jdbc:mysql://172.18.221.213:3306/testemr?useSSL=false";
		//String dburl = "jdbc:mysql://localhost:3306/testemr?useSSL=false";
		String dbUser = "root", dbpwd = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dburl,dbUser,dbpwd);
		String sql = "Insert into patient values(";
		for(int i=0;i<p.length-1;i++) {
			if (p[i]=="") sql += "NULL, ";
			else sql += "'" +p[i]+"',";
		}
		if (p[p.length-1] =="") sql += "NULL);";
		else sql += "'" +p[p.length-1]+"');";
		System.out.println(sql);
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.execute(sql);

	}

}
