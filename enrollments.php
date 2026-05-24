<?php
include 'db.php';

$query = mysqli_query($conn, "
SELECT
    e.enrollment_id,
    s.first_name,
    s.last_name,
    c.course_name,
    b.batch_name,
    e.enrollment_status
FROM enrollments e
JOIN students s
    ON e.student_id = s.student_id
JOIN batches b
    ON e.batch_id = b.batch_id
JOIN courses c
    ON b.course_id = c.course_id
");
?>

<!DOCTYPE html>
<html>

<head>
    <title>Enrollments</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4">Enrollments</h2>

    <table class="table table-bordered table-striped">

        <tr>
            <th>ID</th>
            <th>Student</th>
            <th>Course</th>
            <th>Batch</th>
            <th>Status</th>
        </tr>

        <?php while($row = mysqli_fetch_assoc($query)) { ?>

        <tr>
            <td><?php echo $row['enrollment_id']; ?></td>
            <td><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></td>
            <td><?php echo $row['course_name']; ?></td>
            <td><?php echo $row['batch_name']; ?></td>
            <td><?php echo $row['enrollment_status']; ?></td>
        </tr>

        <?php } ?>

    </table>

    <a href="dashboard.php" class="btn btn-primary">
        Back to Dashboard
    </a>

</div>

</body>
</html>