<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the QR code text from the POST request
    $qrText = $_POST['scanned_code'];

    // Insert the QR code text into the database
    $sql = "INSERT INTO scanned_qr_code (scanned_code) VALUES ('$qrText')";
    if (mysqli_query($conn, $sql)) {
        echo "QR Code data inserted successfully!";
    } else {
        echo "Error inserting QR Code data: " . mysqli_error($conn);
    }
}

mysqli_close($conn);
?>
