package ca.uhn.fhir.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.DomainResource;
import org.hl7.fhir.r4.model.IdType;
import org.hl7.fhir.r4.model.Organization;
import org.hl7.fhir.r4.model.Patient;
import org.hl7.fhir.r4.model.Enumerations.AdministrativeGender;

import ca.uhn.fhir.rest.annotation.IdParam;
import ca.uhn.fhir.rest.annotation.Read;
import ca.uhn.fhir.rest.server.IResourceProvider;
import ca.uhn.fhir.rest.server.exceptions.ResourceNotFoundException;

public class Example04_OrganizationResourceProvider implements IResourceProvider  {

	   @Override
	   public Class<? extends IBaseResource> getResourceType() {
		   return Organization.class;
	   }

	   @Read()
	   public Organization read(@IdParam IdType theId) {
		   if (theId.toString().contains("Organization")) 
			   return getPatient(theId);

		   return null;
	   }
		
	   private Organization getPatient(IdType theId) {
		   Organization patient = new Organization();
		   Connection conn = null;

		   try {
	          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

	          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
	    	  
	    	  Statement stmt = (Statement) conn.createStatement();  
	    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from hospital where hid=" + theId.toString().replace("Organization/", ""));  

	    	  while(rs.next()) {
	    		  patient.setId(theId.toString().replace("Organization/", ""));
	    		  patient.addAddress().setCity(rs.getString("address"));
	    		  patient.setName(rs.getString("HospitalName"));
	    	      patient.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
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
	      
	      if (!patient.hasIdElement()) {
	    	  	throw new ResourceNotFoundException(theId);
	      }

	      return patient;	   
		
	   }
}
