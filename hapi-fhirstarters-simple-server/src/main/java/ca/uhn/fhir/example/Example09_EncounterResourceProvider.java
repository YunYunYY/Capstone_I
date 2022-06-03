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

public class Example09_EncounterResourceProvider implements IResourceProvider {
	@Override
	public Class<? extends IBaseResource> getResourceType() {
		return Encounter.class;
	}

	@Read()
	public Encounter read(@IdParam IdType theId) {
		if (theId.toString().contains("Encounter")) 
			return getEncounter(theId);

		return null;
	}
		
	private Encounter getEncounter(IdType theId) {
		Encounter enc = new Encounter();
		Connection conn = null;

		   try {
	          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

	          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testemr?" + "user=root&password=root");
	    	  
	    	  Statement stmt = (Statement) conn.createStatement();  
	    	  ResultSet rs=((java.sql.Statement) stmt).executeQuery("select * from encounter where eid=" + theId.toString().replace("Encounter/", ""));  

	    	  while(rs.next()) {
	    		  enc.setId(theId.toString().replace("Encounter/", ""));
	    		  CodeableConcept cc = new CodeableConcept();
	    		  cc.addCoding().setDisplay(rs.getString("EncounterType"));
	    		  enc.setServiceType(cc);
	    	      enc.addIdentifier().setSystem("http://acme.org/MRNs").setValue("12345");
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
	      
	      if (!enc.hasIdElement()) {
	    	  	throw new ResourceNotFoundException(theId);
	      }

	      return enc;	   
	}
}
