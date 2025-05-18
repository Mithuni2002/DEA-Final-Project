<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Asiri Hospital - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        body {
    padding-top: 70px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background-image: url('../img/hos2.PNG'); /* Make sure path is correct */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}


        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }

        .dashboard-icon-grid img {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
            transition: transform 0.3s ease;
        }

        .dashboard-icon-grid a {
            text-decoration: none;
            color: #343a40;
            font-weight: 600;
            display: inline-block;
            padding: 20px;
            border-radius: 12px;
            background-color: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .dashboard-icon-grid a:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            background-color: #e9ecef;
        }

        footer {
            margin-top: auto;
            background-color: #212529;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        h2 {
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="position: fixed; inset: 0; background: rgba(255,255,255,0.85); z-index: -1;"></div>


<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/patient/index.jsp">Asiri Hospital</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light btn-sm ms-2" href="../logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Dashboard Section -->
<div class="container mt-5">
    <h2>Welcome, ${sessionScope.patientName}</h2>
    <p class="text-center text-muted mb-4">
    We're glad to have you at Asiri Hospital. Use the options below to manage your appointments, view your receipts, and stay connected with your healthcare journey.
</p>

    <div class="row text-center dashboard-icon-grid mt-4">
        <div class="col-sm-6 col-md-3 mb-4">
            <a href="profile.jsp">
                <img src="../img/profile.png" alt="Profile">
                <div>Profile</div>
            </a>
        </div>
        <div class="col-sm-6 col-md-3 mb-4">
            <a href="chaneling.jsp">
                <img src="../img/channel.png" alt="Channeling">
                <div>Channeling</div>
            </a>
        </div>
        <div class="col-sm-6 col-md-3 mb-4">
            <a href="receipts.jsp">
                <img src="../img/receipt.png" alt="Channel Receipts">
                <div>Channel Receipts</div>
            </a>
        </div>
        <div class="col-sm-6 col-md-3 mb-4">
            <a href="appointment-history.jsp">
                <img src="../img/history.png" alt="Channel History">
                <div>Channel History</div>
            </a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p>&copy; 2025 Asiri Hospital. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../includes/scripts.jsp" %>
</body>
</html>
