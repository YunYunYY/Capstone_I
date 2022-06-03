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

public class Example07_MedicationRequestResourceProvider implements IResourceProvider  {

	   @Override
	   public Class<? extends IBaseResource> getResourceType() {
		   return MedicationRequest.class;
	   }

	   @Read()
	   public MedicationRequest read(@IdParam IdType theId) {
		   if (theId.toString().contains("MedicationRequest")) 
			   return getMedicationRequest(theId);

		   return null;
	   }
		
	   private MedicationRequest getMedicationRequest(IdType theId) {
		   MedicationRequest med = new MedicationRequest();
		   Connection conn = null;

		   try {
	          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

	          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
	    	  
	    	  Statement stmt = (Statement) conn.createStatement();  
	    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from medication where mid=" + theId.toString().replace("MedicationRequest/", ""));  

	    	  while(rs.next()) {
	    		  med.setId(theId.toString().replace("MedicationRequest/", ""));
	    		  Medication me = new Medication();
	    		  CodeableConcept cc = new CodeableConcept();
	    		  cc.addCoding().setCode(rs.getString("MedicationCode")).setDisplay(rs.getString("MedicationName"));
	    		  me.setCode(cc);
	    		  med.setMedication(cc);
	    	      med.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
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
	      
	      if (!med.hasIdElement()) {
	    	  	throw new ResourceNotFoundException(theId);
	      }

	      return med;	   
		
	   }
}
