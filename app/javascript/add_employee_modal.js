// app/javascript/add_employee_modal.js

$(document).ready(function() {
  $('#addEmployeeLink').click(function(e) {
    e.preventDefault(); // Prevent the default link behavior

    // Open the modal
    console.log("Link clicked!"); // Add this line to log a message to the console
    console.log($('#addEmployeeLink').length);
    $('#addEmployeeModal').modal('show');
    
  });
});
  

