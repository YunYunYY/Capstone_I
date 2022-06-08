package Delete;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteDiagnosis
 */
public class DeleteDiagnosis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDiagnosis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s = request.getParameter("dd0");
		try {
			DoMySQL(s);
			writer.println("<html>");
			writer.println("<header>");
			writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://172.18.221.213:8080/FHIRServer/Diagnosis.jsp\">");
			//writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://localhost:8080/FHIRServer/index.jsp\">");
			writer.println("</header>");
			writer.println("<script type=\"text/javascript\">");
			writer.println("alert(\"Delete Success\");");
			writer.println("</script>");
			writer.println("<body>");
			writer.println("</body>");
			writer.println("</html>");
		}
		catch(Exception e) {
			writer.println("<html>");
			writer.println("<header>");
			writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://172.18.221.213:8080/FHIRServer/index.jsp\">");
			//writer.println("<meta http-equiv=\"refresh\"content=\"0;url=http://localhost:8080/FHIRServer/Diagnosis.jsp\">");
			writer.println("</header>");
			writer.println("<script type=\"text/javascript\">");
			writer.println("alert(\"Delete Error\");");
			writer.println("</script>");
			writer.println("<body>");
			writer.println("</body>");
			writer.println("</html>");
			System.out.println("Error ");
			e.printStackTrace();
			System.out.println("Error ");
			e.printStackTrace();
		}
		response.getWriter().append("Done");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	void DoMySQL(String p) throws Exception{
		String dburl = "jdbc:mysql://172.18.221.213:3306/testemr?useSSL=false";
		//String dburl = "jdbc:mysql://localhost:3306/testemr?useSSL=false";
		String dbUser = "root", dbpwd = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dburl,dbUser,dbpwd);
		String sql = "delete from diagnosis where did ="+p+";";
		
		System.out.println(sql);
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.execute(sql);

	}
}
