<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Asiri Hospital</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        .hero-section {
            background: url('../img/hos2.png') center center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 100px 20px;
            position: relative;
        }
        .hero-section::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .hero-section .content {
            position: relative;
            z-index: 1;
        }

        .about-section {
            padding: 60px 0;
        }

        .mission-vision {
            background-color: #f8f9fa;
            padding: 60px 0;
        }

        .team-section {
            padding: 60px 0;
        }

        .team-member img {
            border-radius: 50%;
            width: 140px;
            height: 140px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<!-- Hero Section -->
<div class="hero-section">
    <div class="content container">
        <h1 class="display-4 fw-bold">About Asiri Hospital</h1>
        <p class="lead">Delivering excellence in healthcare with compassion and innovation.</p>
    </div>
</div>

<!-- About Content -->
<div class="about-section container">
    <h2 class="text-center mb-4">Who We Are</h2>
    <p class="fs-5">
        Asiri Hospital is a leading healthcare institution in Sri Lanka with a strong legacy of over 20 years in medical excellence.
        Our commitment lies in combining advanced medical technologies with a personalized approach to healthcare.
    </p>
    <p class="fs-5">
        We offer a wide range of specialized services including cardiology, oncology, orthopedics, pediatrics, and more—delivered by an experienced team of medical professionals.
        Every department is equipped with modern facilities, designed to offer comfort, safety, and superior clinical care.
    </p>
    <p class="fs-5">
        We believe in building trust through quality service and transparent care. Whether it’s emergency support or routine checkups,
        Asiri Hospital is your dependable health partner every step of the way.
    </p>
</div>

<!-- Mission & Vision -->
<div class="mission-vision">
    <div class="container text-center">
        <div class="row">
            <div class="col-md-6 mb-4 mb-md-0">
                <h3>Our Mission</h3>
                <p>To deliver exceptional healthcare with empathy, innovation, and integrity, creating a healthier tomorrow for our community.</p>
            </div>
            <div class="col-md-6">
                <h3>Our Vision</h3>
                <p>To be the most trusted and preferred hospital in the region, known for medical excellence and patient-first care.</p>
            </div>
        </div>
    </div>
</div>


<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/scripts.jsp" %>