package bbb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReadAllergy
 */
public class ReadEncounter extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadEncounter() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String[] para = new String[4];
         for (int i=0; i<para.length; i++)
         para[i] = request.getParameter("row"+i);
         for (int i=0; i<para.length; i++)
         System.out.println(para[i]);
         String s = DoMySQL(para);
         
         
         //response.setContentType("result.jsp");
         PrintWriter out = response.getWriter();
         out.println("<html><body>");
         out.println("<table width=\"100%\" border=\"1\">");
         out.println("<thead>");
         out.println("<tr>");
         out.println("<th>EID</th>");
         out.println("<th>PID</th>");
         out.println("<th>HID</th>");
         out.println("<th>PRID</th>");
         out.println("<th>AdmitDate</th>");
         out.println("<th>EncounterType</th>");
         out.println("</tr>");
         out.println("</thead>");
         out.println("<tbody>");
         
         //Class.forName("com.mysql.jdbc.Driver");
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         try {
            
            String jdbcDriver = "jdbc:mysql://172.18.221.213:3306/testemr?useSSL=false";
            String dbUser = "root";
            String dbPwd = "root";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
            
            pstmt = conn.prepareStatement(s);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               String a = rs.getString("eid");
               String b = rs.getString("pid");
               String c = rs.getString("hid");
               String d = rs.getString("prid");
               String e = rs.getString("AdmitDate");
               String f = rs.getString("EncounterType");
               
               out.println("<tr>");
               out.println("<td>"+a+"</td>");
               out.println("<td>"+b+"</td>");
               out.println("<td>"+c+"</td>");
               out.println("<td>"+d+"</td>");
               out.println("<td>"+e+"</td>");
               out.println("<td>"+f+"</td>");
               out.println("</tr>");
            }
            
         }
         catch (Exception e) {
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
   String DoMySQL(String[] p) {
      String[] key = {"eid","pid","hid","prid","AdmitDate","EncounterType"};
      String sql = "select * from Encounter ";
      boolean q =true;
      for(int i=0;i<p.length;i++) {
         if(p[i]!="") {
            if(q) {
               sql+="where "+key[i]+"='"+p[i]+"'";
               q = false;
            }
            else sql+=" and "+key[i]+"='"+p[i]+"'";
         }
      }
      sql+=";";
      
      System.out.println(sql);   // SQL insert 문장을 만들어 출력해 봄
      
      return sql;
   }

}
