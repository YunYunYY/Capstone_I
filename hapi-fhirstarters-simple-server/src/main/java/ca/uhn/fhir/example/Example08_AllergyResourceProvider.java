package ca.uhn.fhir.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.IdType;
import org.hl7.fhir.r4.model.Practitioner;
import org.hl7.fhir.r4.model.Enumerations.AdministrativeGender;
import org.hl7.fhir.r4.model.AllergyIntolerance;

import ca.uhn.fhir.rest.annotation.IdParam;
import ca.uhn.fhir.rest.annotation.Read;
import ca.uhn.fhir.rest.server.IResourceProvider;
import ca.uhn.fhir.rest.server.exceptions.ResourceNotFoundException;

public class Example08_AllergyResourceProvider implements IResourceProvider{
	@Override
	   public Class<? extends IBaseResource> getResourceType() {
		   return AllergyIntolerance.class;
	   }

	   @Read()
	   public AllergyIntolerance read(@IdParam IdType theId) {
		   if (theId.toString().contains("Allergy")) 
			   return getAllergy(theId);

		   return null;
	   }
		
	   private AllergyIntolerance getAllergy(IdType theId) {
		   AllergyIntolerance allergy = new AllergyIntolerance();
		   Connection conn = null;

		   try {
		          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

		          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
		    	  
		    	  Statement stmt = (Statement) conn.createStatement();  
		    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from allergy where pid=" + theId.toString().replace("Patient/", ""));  
		    	  
		    	  while(rs.next()) {
		    		  /*
		    		  allergy.setId(theId.toString().replace("AllergyIntolerance/", ""));
		    		  allergy.addName().setFamily(rs.getString("lastname")).addGiven(rs.getString("firstname"));
		    		  allergy.addAddress().setCity(rs.getString("city"));
		    		  allergy.setGender(AdministrativeGender.valueOf("MALE"));
		    		  allergy.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
		    	  	*/
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
		      
		      if (!allergy.hasIdElement()) {
		    	  	throw new ResourceNotFoundException(theId);
		      }

		      return allergy;	   
		
	   }
}
