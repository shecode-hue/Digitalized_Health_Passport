<?php

include 'config.php';

// Get the patient code and PIN from the query string
$patientCode = $_GET['code'];
$enteredPIN = $_GET['pin'];

// Query to fetch the patient's PIN from the database
$sql = "SELECT pin FROM patients WHERE codes = '$patientCode'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $patientPIN = $row['pin'];

    if ($enteredPIN == $patientPIN) {
        // PIN is correct
        echo json_encode(array("valid" => true));
    } else {
        // PIN is incorrect
        echo json_encode(array("valid" => false));
    }
} else {
    // Patient not found
    echo json_encode(array("valid" => false));
}

// Close the database connection
$conn->close();
?>
