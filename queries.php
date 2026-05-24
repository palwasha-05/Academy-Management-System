<?php
include 'db.php';
?>

<!DOCTYPE html>
<html>

<head>

    <title>OAMS Queries</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background: #f4f6f9;
        }

        .main-box {
            background: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.08);
        }

        h2 {
            font-weight: bold;
        }

        table {
            border-radius: 15px;
            overflow: hidden;
        }

    </style>

</head>

<body>

<div class="container mt-5">

    <div class="main-box">

        <h2 class="mb-4">
            Advanced SQL Queries
        </h2>

        <form method="GET">

            <label class="mb-2">
                Select Query
            </label>

            <select name="query" class="form-select mb-4" required>

                <option value="">
                    Choose Query
                </option>

                <option value="students">
                    Show All Students
                </option>

                <option value="courses">
                    Show All Courses
                </option>

                <option value="enrollments">
                    Student Enrollment Report
                </option>
</html>