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
 * Servlet implementation class UpdateProvider
 */
public class UpdateProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProvider() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] para = new String[5];
		for(int i=0;i<para.length;i++)
			para[i]=request.getParameter("row"+i);
		for(int i=0;i<para.length;i++)
			System.out.println(para[i]);
		try {
			DoMySQL(para);
			writer.println("<html>");
			writer.println("<header>");
			writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://172.18.221.213:8080/FHIRServer/Provider.jsp\">");
			//writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://localhost:8080/FHIRServer/Provider.jsp\">");
			writer.println("</header>");
			writer.println("<script type=\"text/javascript\">");
			writer.println("alert(\"Update Success\");");
			writer.println("</script>");
			writer.println("<body>");
			writer.println("</body>");
			writer.println("</html>");
		}
		catch(Exception e) {
			writer.println("<html>");
			writer.println("<header>");
			writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://172.18.221.213:8080/FHIRServer/Provider.jsp\">");
			//writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://localhost:8080/FHIRServer/Provider.jsp\">");
			writer.println("</header>");
			writer.println("<script type=\"text/javascript\">");
			writer.println("alert(\"Update Error\");");
			writer.println("</script>");
			writer.println("<body>");
			writer.println("</body>");
			writer.println("</html>");
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
	void DoMySQL(String[] p) throws Exception{
		String dburl = "jdbc:mysql://172.18.221.213:3306/testemr?useSSL=false";
		//String dburl = "jdbc:mysql://localhost:3306/testemr?useSSL=false";
		String dbUser = "root", dbpwd = "root";
		String[] key = {"prid","LicenseNum","ProviderName","SpecialtyCode","SpecialtyName"};
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dburl,dbUser,dbpwd);
		String sql = "Update provider Set ";
		for(int i=1;i<p.length-1;i++) {
			if (p[i]=="") sql+=key[i]+"=NULL,";
			else sql += key[i]+"='" +p[i]+"',";
		}
		if (p[p.length-1] =="") sql+=key[p.length-1]+"=NULL;";
		else sql += key[p.length-1]+"='" +p[p.length-1]+"'";
		sql+=" where "+key[0]+"="+p[0]+";";
		System.out.println(sql);
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.execute(sql);

	}
}
