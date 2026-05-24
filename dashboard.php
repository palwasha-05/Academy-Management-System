<?php
include 'db.php';

$students = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM students"));
$courses = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM courses"));
$batches = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM batches"));

$revenueQuery = mysqli_query($conn, "SELECT SUM(amount) AS total FROM payments WHERE payment_status='Paid'");
$revenueData = mysqli_fetch_assoc($revenueQuery);
$revenue = $revenueData['total'];
?>

<!DOCTYPE html>
<html>

<head>

    <title>OAMS Dashboard</title>

    <link rel="icon" href="images/logo.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>

        body {
            background: #f4f6f9;
            overflow-x: hidden;
        }

        .sidebar {

            width: 250px;
            height: 100vh;
            background: linear-gradient(to bottom, #1e3c72, #2a5298);
            position: fixed;
            padding-top: 20px;
        }

        .sidebar a {

            display: block;
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        .sidebar a:hover {

            background: rgba(255,255,255,0.2);
            padding-left: 35px;
        }

        .active-link {

            background: rgba(255,255,255,0.2);
            border-left: 5px solid white;
        }

        .content {

            margin-left: 260px;
            padding: 30px;
        }

        .card-box {

            border-radius: 20px;
            padding: 25px;
            color: white;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card-box:hover {

            transform: translateY(-5px);
        }

        .chart-card {

            background: white;
            border-radius: 20px;
            padding: 25px;
            margin-top: 40px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.08);
        }

        h2 {
            font-weight: bold;
        }

    </style>

</head>

<body>

<div class="sidebar">

    <div class="text-center mb-4">

        <img src="images/logo.png"
             width="90"
             height="90"
             style="border-radius:50%; object-fit:cover;">

        <h3 class="text-white mt-3">
            OAMS
        </h3>

    </div>

    <a href="dashboard.php" class="active-link">
        Dashboard
    </a>

    <a href="students.php">
        Students
    </a>

    <a href="courses.php">
        Courses
    </a>

    <a href="enrollments.php">
        Enrollments
    </a>

    <a href="payments.php">
        Payments
    </a>

    <a href="queries.php">
        Queries
    </a>

</div>

<div class="content">

    <h2>
        Dashboard
    </h2>

    <p class="text-muted">
        Welcome Admin |
        <?php echo date("l, d F Y"); ?>
    </p>

    <div class="row g-4 mt-2">

        <div class="col-md-3">

            <div class="card-box bg-primary">

                <h5>Total Students</h5>

                <h1>
                    <?php echo $students; ?>
                </h1>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card-box bg-success">

                <h5>Total Courses</h5>

                <h1>
                    <?php echo $courses; ?>
                </h1>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card-box bg-warning">

                <h5>Total Batches</h5>

                <h1>
                    <?php echo $batches; ?>
                </h1>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card-box bg-danger">

                <h5>Total Revenue</h5>

                <h1>
                    Rs. <?php echo $revenue; ?>
                </h1>

            </div>

        </div>

    </div>

    <div class="chart-card">

        <h4 class="mb-4">
            Academy Analytics
        </h4>

        <canvas id="myChart"></canvas>

    </div>

    <footer class="text-center mt-5 text-muted">

        © 2026 Online Academy Management System

    </footer>

</div>

<script>

const ctx = document.getElementById('myChart');

new Chart(ctx, {

    type: 'bar',

    data: {

        labels: [
            'Students',
            'Courses',
            'Batches'
        ],

        datasets: [{

            label: 'OAMS Statistics',

            data: [
                <?php echo $students; ?>,
                <?php echo $courses; ?>,
                <?php echo $batches; ?>
            ],

            borderWidth: 1

        }]
    },

    options: {

        responsive: true,

        scales: {

            y: {
                beginAtZero: true
            }
        }
    }
});

</script>

</body>
</html>