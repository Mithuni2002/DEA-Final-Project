<%@ include file="../includes/admin-head.jsp" %>

<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 40px 20px;
    }

    .admin-container {
        max-width: 800px;
        margin: auto;
    }

    .admin-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .admin-header h2 {
        margin: 0;
        font-weight: 600;
        color: #343a40;
    }

    .admin-header a {
        padding: 6px 14px;
        font-size: 14px;
    }

    .dashboard-cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 20px;
    }

    .card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
        padding: 20px;
        text-align: center;
        transition: transform 0.2s ease;
    }

    .card:hover {
        transform: translateY(-4px);
    }

    .card a {
        display: block;
        color: #198754;
        font-weight: 500;
        text-decoration: none;
        font-size: 18px;
    }

    .card a:hover {
        text-decoration: underline;
    }
</style>

<div class="admin-container">
    <div class="admin-header">
        <h2>Asiri Hospital Admin Dashboard</h2>
        <a href="../logout" class="btn btn-danger btn-sm">Logout</a>
    </div>

    <div class="dashboard-cards">
        <div class="card">
            <a href="add-doctor.jsp">Add Doctor</a>
        </div>
        <div class="card">
            <a href="add-specialization.jsp">Add Specialization</a>
        </div>
        <div class="card">
            <a href="view-appointments.jsp">View Appointments</a>
        </div>
    </div>
</div>

<%@ include file="../includes/scripts.jsp" %>
