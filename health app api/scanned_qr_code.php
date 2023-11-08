<?php
include 'config.php';

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'POST':
        $reg_type = $_REQUEST['post_type'];

        switch ($reg_type) {
            case 'post':
                $post_id = $_POST['scanned_code'];

                $sql = "INSERT INTO scanned_qr_code (scanned_code) VALUES (?)";
                $stmt = mysqli_prepare($conn, $sql);
                mysqli_stmt_bind_param($stmt, "s", $post_id);
                mysqli_stmt_execute($stmt);

                if (mysqli_stmt_affected_rows($stmt) > 0) {
                    echo "Scanned QR code inserted successfully!";
                } else {
                    echo "Error inserting scanned QR code: " . mysqli_error($conn);
                }
                break;
        }
        break;

    case 'GET':
        $sql = "SELECT scanned_code FROM scanned_qr_code ORDER BY ID DESC LIMIT 1";
        $result = mysqli_query($conn, $sql);

        if ($result) {
            $row = mysqli_fetch_assoc($result);
            if ($row) {
                echo $row['scanned_code'];
            } else {
                echo "No scanned QR codes found.";
            }
        } else {
            echo "Error fetching scanned QR code: " . mysqli_error($conn);
        }
        break;
}

mysqli_close($conn);
?>
