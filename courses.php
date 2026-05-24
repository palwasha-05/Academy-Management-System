<?php
include 'db.php';

$query = mysqli_query($conn, "SELECT * FROM courses");
?>

<!DOCTYPE html>
<html>

<head>
    <title>Courses</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4">Courses</h2>

    <table class="table table-bordered table-striped">

        <tr>
            <th>ID</th>
            <th>Course Name</th>
            <th>Fee</th>
            <th>Duration</th>
            <th>Credit Hours</th>
        </tr>

        <?php while($row = mysqli_fetch_assoc($query)) { ?>

        <tr>
            <td><?php echo $row['course_id']; ?></td>
            <td><?php echo $row['course_name']; ?></td>
            <td>Rs. <?php echo $row['fee']; ?></td>
            <td><?php echo $row['duration_months']; ?> Months</td>
            <td><?php echo $row['credit_hours']; ?></td>
        </tr>

        <?php } ?>

    </table>

    <a href="dashboard.php" class="btn btn-primary">
        Back to Dashboard
    </a>

</div>

</body>
</html>