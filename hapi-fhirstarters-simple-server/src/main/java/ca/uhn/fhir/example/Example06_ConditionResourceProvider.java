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

public class Example06_ConditionResourceProvider implements IResourceProvider  {

	   @Override
	   public Class<? extends IBaseResource> getResourceType() {
		   return Condition.class;
	   }

	   @Read()
	   public Condition read(@IdParam IdType theId) {
		   if (theId.toString().contains("Condition")) 
			   return getCondition(theId);

		   return null;
	   }
		
	   private Condition getCondition(IdType theId) {
		   Condition cond = new Condition();
		   Connection conn = null;

		   try {
	          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

	          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
	    	  
	    	  Statement stmt = (Statement) conn.createStatement();  
	    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from diagnosis where did=" + theId.toString().replace("Condition/", ""));  

	    	  while(rs.next()) {
	    		  cond.setId(theId.toString().replace("Condition/", ""));
	    		  CodeableConcept cc = new CodeableConcept();
	    		  cc.addCoding().setCode(rs.getString("DiagnosisCode")).setDisplay(rs.getString("DiagnosisName"));
	    	      cond.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
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
	      
	      if (!cond.hasIdElement()) {
	    	  	throw new ResourceNotFoundException(theId);
	      }

	      return cond;	   
		
	   }
}
