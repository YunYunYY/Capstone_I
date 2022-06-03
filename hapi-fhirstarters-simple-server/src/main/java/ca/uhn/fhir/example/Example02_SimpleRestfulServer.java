package ca.uhn.fhir.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.rest.server.RestfulServer;
import ca.uhn.fhir.rest.server.interceptor.ResponseHighlighterInterceptor;

@WebServlet("/*")
public class Example02_SimpleRestfulServer extends RestfulServer {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initialize() throws ServletException {
		// Create a context for the appropriate version
		setFhirContext(FhirContext.forR4());
		
		// Register resource providers
		registerProvider(new Example01_PatientResourceProvider());
		registerProvider(new Example04_OrganizationResourceProvider());
		registerProvider(new Example05_PractitionerResourceProvider());
		registerProvider(new Example06_ConditionResourceProvider());
		registerProvider(new Example07_MedicationRequestResourceProvider());
		//registerProvider(new Example08_ImagingStudyResourceProvider());
		registerProvider(new Example09_EncounterResourceProvider());
		
		// Format the responses in nice HTML
		registerInterceptor(new ResponseHighlighterInterceptor());
	}
}
