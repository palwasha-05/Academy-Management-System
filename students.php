<?php
include 'db.php';

$query = mysqli_query($conn, "SELECT * FROM students");
?>

<!DOCTYPE html>
<html>

<head>

    <title>Students</title>

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
            Students
        </h2>

        <input type="text"
               id="searchInput"
               class="form-control mb-4"
               placeholder="Search students...">

        <table class="table table-bordered table-striped table-hover">

            <tr class="table-dark">

                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Gender</th>

            </tr>

            <?php while($row = mysqli_fetch_assoc($query)) { ?>

            <tr>

                <td>
                    <?php echo $row['student_id']; ?>
                </td>

                <td>
                    <?php echo $row['first_name'] . ' ' . $row['last_name']; ?>
                </td>

                <td>
                    <?php echo $row['email']; ?>
                </td>

                <td>
                    <?php echo $row['phone']; ?>
                </td>

                <td>
                    <?php echo $row['gender']; ?>
                </td>

            </tr>

            <?php } ?>

        </table>

        <a href="dashboard.php"
           class="btn btn-primary mt-3">

            Back to Dashboard

        </a>

    </div>

    <footer class="text-center mt-4 mb-3 text-muted">

        © 2026 Online Academy Management System

    </footer>

</div>

<script>

document.getElementById("searchInput").addEventListener("keyup", function() {

    let value = this.value.toLowerCase();

    let rows = document.querySelectorAll("table tr");

    rows.forEach((row, index) => {

        if(index === 0) return;

        row.style.display =
            row.innerText.toLowerCase().includes(value)
            ? ""
            : "none";
    });
});

</script>

</body>
</html>