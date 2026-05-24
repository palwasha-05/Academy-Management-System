<?php
include 'db.php';

$query = mysqli_query($conn, "
SELECT
    s.first_name,
    s.last_name,
    p.amount,
    p.payment_method,
    p.payment_status
FROM payments p
JOIN enrollments e
    ON p.enrollment_id = e.enrollment_id
JOIN students s
    ON e.student_id = s.student_id
");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Payments</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4">Payments</h2>

    <table class="table table-bordered table-striped">

        <tr>
            <th>Student</th>
            <th>Amount</th>
            <th>Method</th>
            <th>Status</th>
        </tr>

        <?php while($row = mysqli_fetch_assoc($query)) { ?>

        <tr>
            <td><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></td>
            <td>Rs. <?php echo $row['amount']; ?></td>
            <td><?php echo $row['payment_method']; ?></td>
            <td><?php echo $row['payment_status']; ?></td>
        </tr>

        <?php } ?>

    </table>

    <a href="dashboard.php" class="btn btn-primary">
        Back to Dashboard
    </a>

</div>

</body>
</html>