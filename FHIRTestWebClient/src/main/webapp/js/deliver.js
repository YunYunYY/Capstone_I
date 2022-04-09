function runJsonViewer(data) {
    $('#json-renderer').jsonViewer(data, {
        collapsed: $('#collapsed').is(':checked'), rootCollapsable: $('#root-collapsable').is(':checked'),
        withQuotes: $('#with-quotes').is(':checked'), withLinks: $('#with-links').is(':checked')
    });
}

function runPatient() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/Patient/"+document.getElementById("pid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runPractitioner() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/Practitioner/"+document.getElementById("prid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runHospital() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/Organization/"+document.getElementById("hid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runEncounter() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/Encounter/"+document.getElementById("eid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runDiagnosis() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/Condition/"+document.getElementById("did").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runMedication() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/MedicationRequest/"+document.getElementById("mid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}

function runImageStudy() {
    $(function() {
        var jqxhr = $.get( "http://localhost:8080/hapi-fhirstarters-simple-server/ImagingStudy/"+document.getElementById("imid").value, function() {})
            .done(function(data) {
                runJsonViewer(data);
            })
            .fail(function() { alert( "error" ); });
      });
}