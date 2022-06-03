package ca.uhn.fhir.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.*;
import org.hl7.fhir.r4.model.Enumerations.AdministrativeGender;

import ca.uhn.fhir.rest.annotation.IdParam;
import ca.uhn.fhir.rest.annotation.Read;
import ca.uhn.fhir.rest.server.IResourceProvider;
import ca.uhn.fhir.rest.server.exceptions.ResourceNotFoundException;

public class Example05_PractitionerResourceProvider implements IResourceProvider  {

	   @Override
	   public Class<? extends IBaseResource> getResourceType() {
		   return Practitioner.class;
	   }

	   @Read()
	   public Practitioner read(@IdParam IdType theId) {
		   if (theId.toString().contains("Practitioner")) 
			   return getPractitioner(theId);

		   return null;
	   }
		
	   private Practitioner getPractitioner(IdType theId) {
		   Practitioner prac = new Practitioner();
		   Connection conn = null;

		   try {
	          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

	          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
	    	  
	    	  Statement stmt = (Statement) conn.createStatement();  
	    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from provider where prid=" + theId.toString().replace("Practitioner/", ""));  

	    	  while(rs.next()) {
	    		  prac.setId(theId.toString().replace("Practitioner/", ""));
	    		  prac.addName().setText(rs.getString("ProviderName"));
	    	      prac.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
	    	  }

	      } catch (SQLException ex) {
		   	    System.out.println("SQLException: " + ex.getMessage());
		   	    System.out.println("SQLState: " + ex.getSQLState());
		   	    System.out.println("VendorError: " + ex.getErrorCode());
	      } catch (InstantiationException e) {
				e.printStackTrace();
	      } catch (IllegalAccessException e) {
				e.printStackTrace();
	      } catch (ClassNotFoundException e) {
				e.printStackTrace();
	      }
	      
	      if (!prac.hasIdElement()) {
	    	  	throw new ResourceNotFoundException(theId);
	      }

	      return prac;	   
		
	   }
}
