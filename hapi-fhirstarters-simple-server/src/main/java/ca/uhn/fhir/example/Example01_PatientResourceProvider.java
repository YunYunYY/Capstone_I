package ca.uhn.fhir.example;

import ca.uhn.fhir.rest.annotation.IdParam;
import ca.uhn.fhir.rest.annotation.Read;
import ca.uhn.fhir.rest.server.IResourceProvider;
import ca.uhn.fhir.rest.server.exceptions.ResourceNotFoundException;

import org.hl7.fhir.r4.model.DomainResource;
import org.hl7.fhir.r4.model.Enumerations.AdministrativeGender;
import org.hl7.fhir.r4.model.IdType;
import org.hl7.fhir.r4.model.Organization;
import org.hl7.fhir.r4.model.Patient;
import org.hl7.fhir.instance.model.api.IBaseResource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Example01_PatientResourceProvider implements IResourceProvider {

   private Map<String, Patient> myPatients = new HashMap<String, Patient>();

   public Example01_PatientResourceProvider() {
	   Patient pat1 = new Patient();
	   pat1.setId("1");
	   pat1.addIdentifier().setSystem("http://acme.com/MRNs").setValue("7000135");
	   pat1.addName().setFamily("Simpson").addGiven("Homer").addGiven("J");
	   myPatients.put("1", pat1);
   }

   @Override
   public Class<? extends IBaseResource> getResourceType() {
      return Patient.class;
   }

   @Read()
   public Patient read(@IdParam IdType theId) {
	   if (theId.toString().contains("Patient")) 
		   return getPatient(theId);

	   return null;
   }
	
   private Patient getPatient(IdType theId) {
	   Patient patient = new Patient();
	   Connection conn = null;

	   try {
          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
    	  
    	  Statement stmt = (Statement) conn.createStatement();  
    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from patient where pid=" + theId.toString().replace("Patient/", ""));  

    	  while(rs.next()) {
    		  patient.setId(theId.toString().replace("Patient/", ""));
    		  patient.addName().setFamily(rs.getString("lastname")).addGiven(rs.getString("firstname"));
    		  patient.addAddress().setCity(rs.getString("city"));
    		  patient.setGender(AdministrativeGender.valueOf("MALE"));
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
