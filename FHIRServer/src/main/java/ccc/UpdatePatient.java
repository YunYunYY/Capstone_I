package ccc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePatient
 */
public class UpdatePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatient() {
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
			para[i]=request.getParameter("up"+i);
		for(int i=0;i<8;i++)
			System.out.println(para[i]);
		try {
			DoMySQL(para);
		}
		catch(Exception e) {
			System.out.println("Error ");
			e.printStackTrace();
		}}

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
		String[] key = {"pid","LastName","FirstName","DateOfBirth","Gender","Address","PhoneNum","City"};
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dburl,dbUser,dbpwd);
		String sql = "Update patient Set ";
		for(int i=1;i<7;i++) {
			if (p[i]=="") sql+=key[i]+"=NULL,";
			else sql += key[i]+"='" +p[i]+"',";
		}
		if (p[7] =="") sql+=key[7]+"=NULL;";
		else sql += key[7]+"='" +p[7]+"'";
		sql+=" where "+key[0]+"="+p[0]+";";
		System.out.println(sql);
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.execute(sql);

	}

}
