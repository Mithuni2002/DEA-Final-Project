<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Asiri Hospital - Profile</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Full height for html & body */
        html, body {
            height: 100%;
            margin: 0;
            padding-top: 70px; /* space for fixed navbar */
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
        }

        /* Flex container to push footer and center content */
        .main-content {
            flex: 1 0 auto;
            display: flex;
            justify-content: center; /* horizontal center */
            align-items: center;     /* vertical center */
            padding: 20px;
        }

        /* Profile card styling */
        .profile-card {
            background: white;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            max-width: 600px;
            width: 100%;
            text-align: left;
        }

        .profile-card h3 {
            margin-bottom: 30px;
            color: #343a40;
            text-align: center;
            font-weight: 700;
            font-size: 2rem;
        }

        .profile-card p {
            font-size: 1.1rem;
            margin-bottom: 18px;
            color: #495057;
        }

        .profile-card p strong {
            display: inline-block;
            width: 140px;
            color: #212529;
        }

        .alert-success {
            border-radius: 8px;
            padding: 12px 20px;
            font-size: 1rem;
            margin-bottom: 25px;
        }

        .profile-card a {
            color: #0d6efd;
            font-weight: 600;
            text-decoration: none;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .profile-card a:hover {
            color: #0a58ca;
            text-decoration: underline;
        }

        /* Footer styling */
        footer {
            flex-shrink: 0;
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .profile-card {
                padding: 30px 20px;
                border-radius: 12px;
            }
            .profile-card p strong {
                width: 110px;
            }
        }
    </style>
</head>
<body>

    <%@ include file="../includes/navbar.jsp" %>

    <div class="main-content">
        <div class="profile-card">
            <h3>Profile Details</h3>

            <c:if test="${not empty sessionScope.success}">
                <div class="alert alert-success">${sessionScope.success}</div>
                <c:remove var="success" scope="session" />
            </c:if>

            <p><strong>Name:</strong> ${sessionScope.patientName} ${sessionScope.lastName}</p>
            <p><strong>Date of Birth:</strong> ${sessionScope.dob}</p>
            <p><strong>NIC:</strong> ${sessionScope.nic}</p>
            <p><strong>Address:</strong> ${sessionScope.address}</p>
            <p><strong>Phone:</strong> ${sessionScope.phone}</p>
            <p><strong>Email:</strong> ${sessionScope.email}</p>
            <p>
                <a href="edit-profile.jsp">Edit Profile</a> | 
                <a href="change-password.jsp">Change Password</a>
            </p>
        </div>
    </div>

    <%@ include file="../includes/footer.jsp" %>
    <%@ include file="../includes/scripts.jsp" %>

</body>
</html>
