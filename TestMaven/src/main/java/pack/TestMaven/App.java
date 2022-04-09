package pack.TestMaven;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class App 
{
    public static void main( String[] args ) throws Exception
    {
    	 String dburl = "jdbc:mysql://localhost:3306/capstonetest?useSSL=false&allowPublicKeyRetrieval=true";
         //자신의 데이터베이스명으로 바꿀 것.
         String dbUser = "CapstoneI", dbp = "zoqtmxhsdnjs";//password 입력
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn = DriverManager.getConnection(dburl, dbUser, dbp);
    	String sql = "SELECT * FROM stu";
    	PreparedStatement ps = conn.prepareStatement(sql);
    	ResultSet rs = ps.executeQuery();
    	
    	while (rs.next()) {
    		int num = rs.getInt("sno");
    		Integer age = rs.getInt("grade");
    		String name = rs.getString("name");
    		
    		System.out.println("Record: " +num+" "+ name +" "+ age);
    	}
    }
}