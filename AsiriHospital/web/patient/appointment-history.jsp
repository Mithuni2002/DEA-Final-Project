<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, util.dbConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Appointment History | Asiri Hospital</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .content-wrapper {
            padding-top: 90px; /* Make space for fixed navbar */
            padding-bottom: 40px;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            background-color: #198754;
            color: white;
            font-weight: 600;
            font-size: 1.25rem;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .status-badge {
            font-size: 0.85rem;
            padding: 5px 10px;
            border-radius: 20px;
            text-transform: capitalize;
        }

        .status-Confirmed {
            background-color: #d1e7dd;
            color: #0f5132;
        }

        .status-Pending {
            background-color: #fff3cd;
            color: #664d03;
        }

        .status-Cancelled {
            background-color: #f8d7da;
            color: #842029;
        }

        .no-records {
            text-align: center;
            color: #6c757d;
            padding: 40px 0;
        }
    </style>
</head>
<body>

<!-- Compact Fixed Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm py-2">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/patient/index.jsp">Asiri Hospital</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
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

<!-- Page Content -->
<div class="container content-wrapper">
    <div class="card">
        <div class="card-header">
            Appointment History
        </div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Date</th>
                        <th>Doctor</th>
                        <th>Specialization</th>
                        <th>Time</th>
                        <th>Price (LKR)</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    Integer patientIdObj = (Integer) session.getAttribute("patientId");
                    int patientId = (patientIdObj != null) ? patientIdObj : -1;

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        conn = new dbConnect().connect();
                        stmt = conn.prepareStatement(
                            "SELECT c.appointment_date, c.appointment_time, c.status, d.name AS doctor_name, " +
                            "s.name AS specialization, d.price " +
                            "FROM channel c " +
                            "JOIN doctor d ON c.doctor_id = d.id " +
                            "JOIN specialization s ON c.specialization_id = s.id " +
                            "WHERE c.patient_id = ? " +
                            "ORDER BY c.appointment_date DESC, c.appointment_time ASC"
                        );
                        stmt.setInt(1, patientId);
                        rs = stmt.executeQuery();

                        boolean hasRecords = false;
                        while (rs.next()) {
                            hasRecords = true;
                            String status = rs.getString("status");
                %>
                    <tr>
                        <td><%= rs.getString("appointment_date") %></td>
                        <td><%= rs.getString("doctor_name") %></td>
                        <td><%= rs.getString("specialization") %></td>
                        <td><%= rs.getString("appointment_time") %></td>
                        <td><%= rs.getDouble("price") %></td>
                        <td>
                            <span class="status-badge status-<%= status %>"><%= status %></span>
                        </td>
                    </tr>
                <%
                        }

                        if (!hasRecords) {
                %>
                    <tr>
                        <td colspan="6" class="no-records">No appointments found.</td>
                    </tr>
                <%
                        }

                    } catch (SQLException e) {
                        out.println("<tr><td colspan='6' class='text-danger text-center'>Error loading appointment history.</td></tr>");
                        e.printStackTrace();
                    } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) {}
                        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                        try { if (conn != null) conn.close(); } catch (Exception e) {}
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="../includes/footer.jsp" %>

<!-- Scripts -->
<%@ include file="../includes/scripts.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
