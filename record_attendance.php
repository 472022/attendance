<?php
// Start session to persist login state
session_start();

// Check if teacher is logged in
if (!isset($_SESSION['teacher_logged_in']) || $_SESSION['teacher_logged_in'] !== true) {
    // Redirect to login page if not logged in
    header("Location: teacherlogin.php");
    exit;
}

// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$database = "manag";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve current date
$current_date = date("Y-m-d");

// Retrieve subject from form submission
$subject = $_POST['subject'];

// Retrieve attendance data from form submission
$attendance_data = $_POST['attendance'];

$success_count = 0; // Counter for successfully recorded attendance

foreach ($attendance_data as $rollno => $status) {
    // Retrieve student data
    $sql_student = "SELECT * FROM studentdata WHERE rollno = '$rollno'";
    $result_student = $conn->query($sql_student);

    if ($result_student->num_rows > 0) {
        $row_student = $result_student->fetch_assoc();
        $name = $row_student['name'];
        $prn = $row_student['prn'];
        $year = $row_student['year'];
        $branch = $row_student['branch'];
        $division = $row_student['div'];
        $batch = $row_student['batch'];

        // Escape values to prevent SQL injection
        $name = $conn->real_escape_string($name);
        $prn = $conn->real_escape_string($prn);

        $year = $conn->real_escape_string($year);
        $branch = $conn->real_escape_string($branch);
        $division = $conn->real_escape_string($division);
        $batch = $conn->real_escape_string($batch);
        $status = $conn->real_escape_string($status);

        // Check if record already exists for the combination of rollno, date, subject, and status
        $sql_check_record = "SELECT * FROM attendance WHERE rollno = '$rollno' AND date = '$current_date' AND subject = '$subject'";

        $result_check = $conn->query($sql_check_record);

        if ($result_check->num_rows == 0) {
            // Record does not exist, insert new attendance record
            $sql_insert_attendance = "INSERT INTO attendance (prn,rollno, name, year, branch, division, batch, date, subject, status) VALUES ('$prn','$rollno', '$name', '$year', '$branch', '$division', '$batch', '$current_date', '$subject', '$status')";

            if ($conn->query($sql_insert_attendance) === TRUE) {
                $success_count++;
            } else {
                echo "Error inserting attendance data: " . $conn->error;
            }
        }
    }
}

// Close database connection
$conn->close();

// JavaScript alert to display success message
echo "<script>alert('Attendance recorded successfully for " . $success_count . " students.'); window.location.href='markattendance.php';</script>";
?>
