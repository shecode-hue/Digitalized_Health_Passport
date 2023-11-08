<?php

include 'config.php';
// Get the patient code from the query string
$patientCode = $_GET['code'];

// Query to fetch patient data based on the code
$sql = "SELECT * FROM patients WHERE codes = '$patientCode'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Fetch the patient data and format it as HTML
    $patientData = '';
    while ($row = $result->fetch_assoc()) {
        $patientData .= "<p>First Name: " . $row['first_name'] . "</p>";
        $patientData .= "<p>Last Name: " . $row['last_name'] . "</p>";
        $patientData .= "<p>Gender: " . $row['gender'] . "</p>";
        $patientData .= "<p>Date of Birth: " . $row['date_of_birth'] . "</p>";
        $patientData .= "<p>Address: " . $row['address'] . "</p>";
        $patientData .= "<p>City: " . $row['city'] . "</p>";
        $patientData .= "<p>State: " . $row['state'] . "</p>";
        $patientData .= "<p>Zip Code: " . $row['zip_code'] . "</p>";
        $patientData .= "<p>Phone Number: " . $row['phone_number'] . "</p>";
        $patientData .= "<p>Email: " . $row['email'] . "</p>";
        $patientData .= "<p>Blood Type: " . $row['blood_type'] . "</p>";
        $patientData .= "<p>Height: " . $row['height'] . "</p>";
        $patientData .= "<p>Weight: " . $row['weight'] . "</p>";
        $patientData .= "<p>Allergies: " . $row['allergies'] . "</p>";
        $patientData .= "<p>Medical Conditions: " . $row['medical_conditions'] . "</p>";
        $patientData .= "<p>Prescriptions: " . $row['prescriptions'] . "</p>";
        $patientData .= "<p>Emergency Contact Name: " . $row['emergency_contact_name'] . "</p>";
        $patientData .= "<p>Emergency Contact Phone: " . $row['emergency_contact_phone'] . "</p>";
        $patientData .= "<p>Insurance Provider: " . $row['insurance_provider'] . "</p>";
        $patientData .= "<p>Insurance Policy Number: " . $row['insurance_policy_number'] . "</p>";
    }

    // Return the patient data as HTML
    echo $patientData;
} else {
    echo "Patient not found.";
}

// Close the database connection
$conn->close();
